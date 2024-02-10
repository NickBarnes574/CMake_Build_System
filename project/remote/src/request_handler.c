#include "request_handler.h"
#include "command_codes.h"
#include "tcp_server.h"
#include "utilities.h"

static int read_opcode(uint8_t *opcode, int client_fd);

void *process_request(void *arg_p)
{
    int exit_code;
    client_data_t *data_p = NULL;
    user_shared_data_t *shared_data_p = NULL;
    int client_fd = -1;
    uint8_t opcode = -1;

    if (NULL == arg_p)
    {
        print_error("process_request(): NULL argument passed.");
        goto END;
    }

    data_p = (client_data_t *)arg_p;
    shared_data_p = (user_shared_data_t *)data_p->user_data_p;
    client_fd = data_p->client_fd;

    printf("placeholder: %d\n", shared_data_p->placeholder);

    while (E_SUCCESS == read_opcode(&opcode, data_p->client_fd))
    {
        switch (opcode)
        {
        case BLINK:
            exit_code = blink(client_fd);
            if (E_SUCCESS != exit_code)
            {
                print_error("process_request(): Error processing client request.");
                goto END;
            }
            break;

        default:
            break;
        }
    }

END:
    return NULL;
}

// +---------------------------------------------------------------------------+
// |                        STATIC FUNCTION DEFINITIONS                        |
// +---------------------------------------------------------------------------+

static int read_opcode(uint8_t *opcode, int client_fd)
{
    int exit_code = E_FAILURE;
    uint8_t result = -1;

    if (NULL == opcode)
    {
        print_error("read_opcode(): NULL argument passed.");
        goto END;
    }

    exit_code = recv_data(client_fd, &result, sizeof(uint8_t));
    if (E_SUCCESS != exit_code)
    {
        goto END;
    }

    *opcode = result;
END:
    return exit_code;
}

/*** end of file ***/
