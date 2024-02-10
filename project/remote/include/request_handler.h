/**
 * @file request_handler.h
 *
 * @brief
 */
#ifndef _REQUEST_HANDLER_H
#define _REQUEST_HANDLER_H

#include <stdio.h>
#include <stdlib.h>

typedef struct user_shared_data
{
    int placeholder;
    // Any other user data goes here.
    // hash tables for instance...
} user_shared_data_t;

typedef void *(*request_t)(void *args_p);

void *process_request(void *arg_p);

#endif /* _REQUEST_HANDLER_H */

/*** end of file ***/
