#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "comparisons.h"
#include "utilities.h"

comp_rtns_t int_comp(void * p_node_one_data, void * p_node_two_data)
{
    comp_rtns_t result   = ERROR;
    int         data_one = 0;
    int         data_two = 0;

    if ((NULL == p_node_one_data) || (NULL == p_node_two_data))
    {
        print_error("NULL argument passed.");
        goto END;
    }

    data_one = *(int *)p_node_one_data;
    data_two = *(int *)p_node_two_data;

    if (data_one == data_two)
    {
        result = EQUAL;
        goto END;
    }

    if (data_one > data_two)
    {
        result = GREATER_THAN;
        goto END;
    }

    if (data_one < data_two)
    {
        result = LESS_THAN;
        goto END;
    }

END:
    return result;
}

comp_rtns_t str_comp(void * p_node_one_data, void * p_node_two_data)
{
    comp_rtns_t result            = ERROR;
    char *      data_one_p        = NULL;
    char *      data_two_p        = NULL;
    int         comparison_result = 0;

    if ((NULL == p_node_one_data) || (NULL == p_node_two_data))
    {
        print_error("NULL argument passed.");
        goto END;
    }

    data_one_p = (char *)p_node_one_data;
    data_two_p = (char *)p_node_two_data;

    comparison_result =
        strncmp(data_one_p, data_two_p, strnlen(data_one_p, 1000));

    if (0 == comparison_result)
    {
        result = EQUAL;
        goto END;
    }

    if (0 > comparison_result)
    {
        result = LESS_THAN;
        goto END;
    }

    if (0 < comparison_result)
    {
        result = GREATER_THAN;
        goto END;
    }

END:
    return result;
}

/*** end of file ***/