/**
 * @file   tcp_server.c
 * @brief  Manages the main server functionalities for a TCP server
 *
 * This file contains functions for configuring and setting up the server,
 * listening for client connections, and handling incoming client requests.
 * Functions for socket creation, binding, and listening are also included.
 * The server leverages a thread pool to handle multiple client connections.
 */

#define _GNU_SOURCE

#include <arpa/inet.h>  // bind(), accept()
#include <errno.h>      // Accessing 'errno' global variable
#include <netdb.h>      // getaddrinfo() struct
#include <pthread.h>    // mutex
#include <stdio.h>      // printf(), fprintf()
#include <stdlib.h>     // calloc(), free()
#include <string.h>     // strerror()
#include <sys/socket.h> // socket()
#include <unistd.h>     // close()

#include "account_management.h" // create_default_user()
#include "client_args.h"
#include "custom_free_funcs.h" // custom free functions
#include "hash_table.h"
#include "packets.h"
#include "signal_handler.h"
#include "socket_io.h"
#include "tcp_server.h"
#include "utilities.h"

#define INVALID_SOCKET          (-1) // Indicates an invalid socket descriptor
#define BACKLOG_SIZE            10 // Maximum number of pending client connections
#define MAX_CLIENT_ADDRESS_SIZE 100 // Size for storing client address strings
#define MAX_TABLE_SIZE          500
#define TIMEOUT                 300
#define SESSION_START           1000 // The base starting value for a session ID

//
// -----------------------------STRUCT DEFINITIONS-----------------------------
//

/**
 * @struct server_cfg
 * @brief  Holds the configuration settings for the server.
 *
 * This structure stores all the necessary information for setting up
 * and running the server, such as the address to bind to, the
 * listening socket, and client-specific details.
 */
struct server_cfg
{
    struct addrinfo   hints;        // Specifies criteria for address selection
    struct addrinfo * address_list; // Pointer to linked list of address info
    struct addrinfo *
        current_address;  // Pointer used to traverse 'address_list'
    int listening_socket; // Listening socket for the server
    struct sockaddr_storage client_address; // Stores client address
    int                     client_fd;      // Socket for accepting connections
    request_handler_t       handler_func;
    socklen_t               client_len; // Length of client address structure
    pthread_mutex_t         lock;
    uint32_t                session_id;
    uint32_t                user_id;
    hash_table_t *          account_table_p;
    hash_table_t *          session_table_p;
    hash_table_t *          data_table_p;
};

//
// -----------------------------UTILITY FUNCTIONS-----------------------------
//

/**
 * @brief Free client arguments.
 *
 * @param args_p Pointer to client arguments to be freed.
 */
static void free_args(void * args_p);

/**
 * @brief Print the client's address to the console.
 *
 * @param config Server configuration structure.
 */
static void print_client_address(server_cfg_t * config);

//
// ----------------------SERVER INITIALIZATION FUNCTIONS----------------------
//

/**
 * @brief Configure the server's address settings.
 *
 * @param config Server configuration structure.
 * @param port_p Pointer to port string.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int configure_server_address(server_cfg_t * config, char * port_p);

/**
 * @brief Create a listening socket for the server.
 *
 * @param config Server configuration structure.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int create_listening_socket(server_cfg_t * config);

/**
 * @brief Bind the listening socket to an address.
 *
 * @param config Server configuration structure.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int bind_socket(server_cfg_t * config);

/**
 * @brief Activate the listening mode on the server's socket.
 *
 * @param config Server configuration structure.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int activate_listening_mode(server_cfg_t * config);

//
// -----------------------------CORE FUNCTIONALITY-----------------------------
//

/**
 * @brief Main loop for listening for client connections.
 *
 * @param config Server configuration structure.
 * @param threadpool_p Pointer to the threadpool.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int listen_for_client_connections(server_cfg_t * config,
                                         threadpool_t * threadpool_p);

/**
 * @brief Open a new connection and handle it with a thread.
 *
 * @param config Server configuration structure.
 * @param threadpool_p Pointer to the threadpool.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int open_new_connection(server_cfg_t * config,
                               threadpool_t * threadpool_p);

/**
 * @brief Accept a new client connection.
 *
 * @param config Server configuration structure.
 * @return 0 (E_SUCCESS) on success, -1 (E_FAILURE) on failure.
 */
static int accept_connection(server_cfg_t * config);

/**
 * @brief Handle client request logic.
 *
 * @param args_p Pointer to client arguments.
 * @return NULL.
 */
static void * handle_client_request(void * args_p);

// +---------------------------------------------------------------------------+
// |                            MAIN SERVER FUNCTION                           |
// +---------------------------------------------------------------------------+

int start_server(size_t            num_threads,
                 char *            port_p,
                 request_handler_t handler_func)
{
    int            exit_code       = E_FAILURE;
    server_cfg_t * config          = NULL;
    threadpool_t * threadpool_p    = NULL;
    hash_table_t * account_table_p = NULL;
    hash_table_t * session_table_p = NULL;
    hash_table_t * data_table_p    = NULL;

    if ((NULL == port_p) || (NULL == handler_func))
    {
        print_error("NULL argument passed.");
        goto END;
    }

    if (2 > num_threads)
    {
        print_error("Number of threads must be 2 or more.");
        goto END;
    }

    threadpool_p = threadpool_create(num_threads);
    if (NULL == threadpool_p)
    {
        print_error("start_server(): Unable to create threadpool.");
        goto END;
    }

    account_table_p = hash_table_init(MAX_TABLE_SIZE, free_user_info);
    if (NULL == account_table_p)
    {
        print_error("start_server(): Unable to initialize account table.");
        goto END;
    }

    session_table_p = hash_table_init(MAX_TABLE_SIZE, free_nothing);
    if (NULL == session_table_p)
    {
        print_error("start_server(): Unable to initialize session table.");
        goto END;
    }

    data_table_p = hash_table_init(MAX_TABLE_SIZE, free_data_info);
    if (NULL == data_table_p)
    {
        print_error("start_server(): Unable to initialize data table.");
        goto END;
    }

    // Create a default admin user
    exit_code = create_default_user(account_table_p);
    if (E_SUCCESS != exit_code)
    {
        print_error("handle_request(): Unable to create default user.");
        goto END;
    }

    config = calloc(1, sizeof(server_cfg_t));
    if (NULL == config)
    {
        exit_code = E_FAILURE;
        goto END;
    }

    config->handler_func    = handler_func;
    config->account_table_p = account_table_p;
    config->session_table_p = session_table_p;
    config->data_table_p    = data_table_p;
    config->session_id      = SESSION_START;

    exit_code = pthread_mutex_init(&config->lock, NULL);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to initialize lock mutex.");
        goto END;
    }

    exit_code = configure_server_address(config, port_p);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to configure local address.");
        goto END;
    }

    exit_code = activate_listening_mode(config);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to listen on socket.");
        goto END;
    }

    exit_code = listen_for_client_connections(config, threadpool_p);
    if (E_SUCCESS != exit_code)
    {
        if (SHUTDOWN == exit_code)
        {
            goto END;
        }

        print_error("Unable to monitor sockets.");
        goto END;
    }

    exit_code = E_SUCCESS;
END:
    printf("Closing connection...\n");
    if (NULL != config)
    {
        close(config->listening_socket);
    }
    free(config);

    if (NULL != threadpool_p)
    {
        exit_code = threadpool_destroy(&threadpool_p);
        if (E_SUCCESS != exit_code)
        {
            print_error("start_server(): Unable to destroy threadpool.");
        }
    }

    if (NULL != account_table_p)
    {
        exit_code = hash_table_destroy(&account_table_p);
        if (E_SUCCESS != exit_code)
        {
            print_error("start_server(): Unable to destroy account table.");
        }
    }

    if (NULL != session_table_p)
    {
        exit_code = hash_table_destroy(&session_table_p);
        if (E_SUCCESS != exit_code)
        {
            print_error("start_server(): Unable to destroy session table.");
        }
    }

    if (NULL != data_table_p)
    {
        exit_code = hash_table_destroy(&data_table_p);
        if (E_SUCCESS != exit_code)
        {
            print_error("start_server(): Unable to destroy data table.");
        }
    }

    return exit_code;
}

// *****************************************************************************
//                          STATIC FUNCTION DEFINITIONS
// *****************************************************************************

static int configure_server_address(server_cfg_t * config, char * port_p)
{
    int exit_code = E_FAILURE;

    if ((NULL == config) || (NULL == port_p))
    {
        print_error("NULL argument passed.");
        goto END;
    }

    // Setup a TCP server address using IPV4
    config->hints = (struct addrinfo) { .ai_family   = AF_INET,     // IPV4
                                        .ai_socktype = SOCK_STREAM, // TCP
                                        .ai_flags = AI_PASSIVE, // For binding
                                        .ai_protocol  = 0,
                                        .ai_canonname = NULL,
                                        .ai_addr      = NULL,
                                        .ai_next      = NULL };

    // Get a list of address structures and store them in 'config->address_list'
    exit_code =
        getaddrinfo(NULL, port_p, &config->hints, &config->address_list);
    if (E_SUCCESS != exit_code)
    {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(exit_code));
        goto END;
    }

    // Try each address, attempting to create a socket and bind
    for (config->current_address = config->address_list;
         config->current_address != NULL;
         config->current_address = config->current_address->ai_next)
    {
        exit_code = create_listening_socket(config);
        if (E_SUCCESS != exit_code)
        {
            /**
             * NOTE: Barr-C generally discourages the use of the `continue`
             * keyword, but I think it makes sense in this case. Using flags and
             * additional conditional statements in order to factor out the
             * `continue` keyword could diminish readability.
             */
            continue;
        }

        exit_code = bind_socket(config);
        if (E_SUCCESS == exit_code)
        {
            // Successfully bound socket
            break;
        }

        // Close the socket if unsuccessful
        close(config->listening_socket);
    }

    exit_code = E_SUCCESS;
END:
    freeaddrinfo(config->address_list);
    return exit_code;
}

static int create_listening_socket(server_cfg_t * config)
{
    int exit_code      = E_FAILURE;
    int sock_opt_check = 0; // To check the return value of setsockopt
    int optval         = 1; // Enable SO_REUSEADDR

    if (NULL == config)
    {
        print_error("NULL argument passed.");
        goto END;
    }

    // Create a new socket
    errno                    = 0;
    config->listening_socket = socket(config->current_address->ai_family,
                                      config->current_address->ai_socktype,
                                      config->current_address->ai_protocol);
    if (INVALID_SOCKET >= config->listening_socket)
    {
        fprintf(stderr, "socket() failed. (%s)\n", strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    // Enable the SO_REUSEADDR option to reuse the local address
    sock_opt_check = setsockopt(config->listening_socket,
                                SOL_SOCKET,
                                SO_REUSEADDR,
                                &optval,
                                sizeof(optval));
    if (0 > sock_opt_check)
    {
        fprintf(stderr, "setsockopt() failed. (%s)\n", strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

static int bind_socket(server_cfg_t * config)
{
    int exit_code = E_FAILURE;

    if (NULL == config)
    {
        print_error("bind_socket(): NULL argument passed.");
        goto END;
    }

    // Bind the listening socket to the server address specified in
    // config->bind_address. The address family, socket type, and protocol are
    // extracted from the addrinfo structure.
    errno     = 0;
    exit_code = bind(config->listening_socket,
                     config->current_address->ai_addr,
                     config->current_address->ai_addrlen);

    if (E_SUCCESS != exit_code)
    {
        fprintf(stderr, "bind() failed. (%s)\n", strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

static int activate_listening_mode(server_cfg_t * config)
{
    int exit_code = E_FAILURE;

    if (NULL == config)
    {
        print_error("activate_listening_mode(): NULL argument passed.");
        goto END;
    }

    // Activate listening mode for the server's socket, allowing it to queue up
    // to 'BACKLOG_SIZE' connection requests at a time.
    errno     = 0;
    exit_code = listen(config->listening_socket, BACKLOG_SIZE);
    if (E_SUCCESS != exit_code)
    {
        fprintf(stderr, "listen() failed. (%s)\n", strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

static int listen_for_client_connections(server_cfg_t * config,
                                         threadpool_t * threadpool_p)
{
    int exit_code = E_FAILURE;

    if ((NULL == config) || (NULL == threadpool_p))
    {
        print_error("NULL argument passed.");
        goto END;
    }

    printf("Waiting for client connections...\n");

    // Constantly monitor sockets for any incoming connections
    for (;;)
    {
        if ((signal_flag_g == SIGINT) || (signal_flag_g == SIGUSR1))
        {
            printf("\nShutdown signal received.\n");
            exit_code = SHUTDOWN;
            goto END;
        }

        exit_code = open_new_connection(config, threadpool_p);
        if (E_SUCCESS != exit_code)
        {
            if (SHUTDOWN == exit_code)
            {
                goto END;
            }

            print_error("Error opening new connection.");
            goto END;
        }
    }
END:
    return exit_code;
}

static int open_new_connection(server_cfg_t * config,
                               threadpool_t * threadpool_p)
{
    int exit_code = E_FAILURE;

    if ((NULL == config) || (NULL == threadpool_p))
    {
        print_error("NULL argument passed.");
        goto END;
    }

    exit_code = accept_connection(config);
    if (E_SUCCESS != exit_code)
    {
        if (SHUTDOWN == exit_code)
        {
            goto END;
        }

        print_error("Unable to accept connection.");
        goto END;
    }

    client_args_t * args = calloc(1, sizeof(client_args_t));
    if (NULL == args)
    {
        print_error("CMR Failure.");
        goto END;
    }

    args->client_fd       = config->client_fd;
    args->handler_func    = config->handler_func;
    args->lock            = config->lock;
    args->account_table_p = config->account_table_p;
    args->session_table_p = config->session_table_p;
    args->data_table_p    = config->data_table_p;
    args->session_id      = &config->session_id;

    exit_code = threadpool_add_job(
        threadpool_p, handle_client_request, free_args, args);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add job to threadpool.");
        close(config->client_fd);
        goto END;
    }

    print_client_address(config);

END:
    return exit_code;
}

static int accept_connection(server_cfg_t * config)
{
    int exit_code = E_FAILURE;

    if (NULL == config)
    {
        print_error("accept_connection(): NULL argument passed.");
        goto END;
    }

    config->client_len = sizeof(config->client_address);
    int sock_opt_check = 0; // To check the return value of setsockopt
    struct timeval timeout; // Timeout for socket operations

    // Attempt to accept a new client connection using the listening socket.
    // If the accept() function returns an invalid client fd, check for shutdown
    // signals (SIGINT or SIGUSR1).
    errno             = 0;
    config->client_fd = accept(config->listening_socket,
                               (struct sockaddr *)&config->client_address,
                               &config->client_len);
    if (INVALID_SOCKET >= config->client_fd)
    {
        if ((signal_flag_g == SIGINT) || (signal_flag_g == SIGUSR1))
        {
            printf("\nShutdown signal received.\n");
            exit_code = SHUTDOWN;
            goto END;
        }

        fprintf(stderr, "accept() failed. (%s)\n", strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    // Set a timeout (e.g., 30 seconds) for socket operations
    timeout.tv_sec  = TIMEOUT; // 30 seconds
    timeout.tv_usec = 0;       // 0 microseconds

    sock_opt_check = setsockopt(config->client_fd,
                                SOL_SOCKET,
                                SO_RCVTIMEO,
                                (char *)&timeout,
                                sizeof(timeout));
    if (0 > sock_opt_check)
    {
        fprintf(stderr,
                "setsockopt() for SO_RCVTIMEO failed. (%s)\n",
                strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    sock_opt_check = setsockopt(config->client_fd,
                                SOL_SOCKET,
                                SO_SNDTIMEO,
                                (char *)&timeout,
                                sizeof(timeout));
    if (0 > sock_opt_check)
    {
        fprintf(stderr,
                "setsockopt() for SO_SNDTIMEO failed. (%s)\n",
                strerror(errno));
        exit_code = E_FAILURE;
        goto END;
    }

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

static void * handle_client_request(void * args_p)
{
    int exit_code = E_FAILURE;

    client_args_t * new_args_p = (client_args_t *)args_p;

    exit_code = new_args_p->handler_func(new_args_p);

    if (E_SUCCESS != exit_code)
    {
        print_error("Error handling client request.");
        goto END;
    }

END:
    if (NULL != new_args_p)
    {
        close(new_args_p->client_fd);
    }
    free(new_args_p);
    return NULL;
}

static void print_client_address(server_cfg_t * config)
{
    char address_buffer[MAX_CLIENT_ADDRESS_SIZE];
    getnameinfo((struct sockaddr *)&config->client_address,
                config->client_len,
                address_buffer,
                sizeof(address_buffer),
                0,
                0,
                NI_NUMERICHOST);
    printf("Connection established - [%s]\n", address_buffer);
}

static void free_args(void * args_p)
{
    if (NULL != args_p)
    {
        return;
    }
}

/*** end of file ***/
