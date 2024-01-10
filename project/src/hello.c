#include <stdio.h>
#include <stdlib.h>

#include "utilities.h"

int main()
{
    int exit_code = E_FAILURE;

    printf("Hello World!\n");

    // Should only print in debug mode
    print_error("DEBUG");

    exit_code = E_SUCCESS;
END:
    return exit_code;
}
