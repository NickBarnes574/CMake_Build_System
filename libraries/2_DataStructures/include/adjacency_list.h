/**
 * @file adjacency_list.h
 *
 * @brief
 */
#ifndef _ADJACENCY_LIST_H
#define _ADJACENCY_LIST_H

#include <stdbool.h>
#include <stdint.h>

#include "linked_list.h"

typedef void (*FREE_F)(void *);

typedef struct
{
    void *   data_p;
    size_t   edge_count;
    list_t * edge_list_p;
} node_t;

typedef struct
{
    node_t * node_1_p;
    node_t * node_2_p;
    size_t   weight;
    bool     is_directed;
} edge_t;

typedef struct
{
    size_t   node_count;
    list_t * node_list_p;
    FREE_F   custom_free;
    CMP_F    custom_compare;
} graph_t;

graph_t * graph_create(FREE_F custom_free, CMP_F custom_compare);
node_t *  graph_create_node(void * data_p);
int       graph_add_node(graph_t * graph_p, void * data_p);
int       graph_remove_node(graph_t * graph_p, void * data_p);
int       graph_add_edge(graph_t * graph_p,
                         void *    data_1_p,
                         void *    data_2_p,
                         size_t    weight,
                         bool      is_bidirectional);
int      graph_remove_edge(graph_t * graph_p, void * data_1_p, void * data_2_p);
size_t   graph_get_size(graph_t * graph_p);
node_t * graph_find_node(graph_t * graph_p, void * data_p);
edge_t * graph_find_edge(graph_t * graph_p,
                         node_t *  node_1_p,
                         node_t *  node_2_p);
int      graph_clear(graph_t * graph_p);
int      graph_destroy(graph_t ** graph_pp);
#endif /* _ADJACENCY_LIST_H */

/*** end of file ***/
