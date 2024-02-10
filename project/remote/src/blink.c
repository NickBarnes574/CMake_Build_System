#include "request_handler.h"
#include "signal_handler.h"
#include "socket_io.h"
#include "tcp_server.h"
#include "utilities.h"

#include <bcm2835.h> // For Raspberry Pi GPIO
#include <unistd.h>

#define MAX_BUFF_SIZE 14
#define PLACEHOLDER_NUM 10
#define BCM_INIT_FAILURE 0

int main(int argc, char **argv)
{
    int exit_code = E_FAILURE;
    user_shared_data_t shared_data = {0};
    (void)argc;
    (void)argv;

    exit_code = signal_action_setup();
    if (E_SUCCESS != exit_code)
    {
        print_error("main(): Unable to setup signal handler.");
        goto END;
    }

    shared_data.placeholder = PLACEHOLDER_NUM;

    exit_code =
        start_tcp_server("31337", 4, process_request, NULL, &shared_data);
    if (E_SUCCESS != exit_code)
    {
        print_error("main(): Unable to run server.");
        goto END;
    }

END:
    return exit_code;
}

int blink(int client_fd)
{
    int exit_code = E_FAILURE;
    int bcm_check = 0;

    (void)client_fd; // Ignore this for now

    bcm_check = bcm2835_init();
    if (BCM_INIT_FAILURE == bcm_check)
    {
        exit_code = E_FAILURE;
        print_error("blink(): Failed to initialize bcm2835.");
        goto END;
    }

    // Set GPIO pin 21 as an output
    bcm2835_gpio_fsel(RPI_BPLUS_GPIO_J8_40, BCM2835_GPIO_FSEL_OUTP);

    while (1)
    {
        if ((signal_flag_g == SIGINT) || (signal_flag_g == SIGUSR1))
        {
            printf("\nblink(): Shutdown signal received.\n");
            goto END;
        }
        // Turn LED on
        bcm2835_gpio_write(RPI_BPLUS_GPIO_J8_40, HIGH);
        sleep(1); // wait for 1 second

        // Turn the LED off
        bcm2835_gpio_write(RPI_BPLUS_GPIO_J8_40, LOW);
        sleep(1); // wait for another second
    }

END:
    bcm2835_gpio_write(RPI_BPLUS_GPIO_J8_40, LOW); // Ensure LED is off
    bcm_check = bcm2835_close();                   // Clean up bcm2835
    if (BCM_INIT_FAILURE == bcm_check)
    {
        exit_code = E_FAILURE;
        print_error("blink(): failed to properly close bcm2835.");
    }

    return exit_code;
}
