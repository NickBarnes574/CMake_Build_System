#include "adjacency_matrix.h"

struct node
{
    void * data;  // Data for the node
    char * label; // Node label
};

struct edge
{
    size_t weight; // Weight of the edge
};

struct matrix
{
    edge_t ** edges;          // 2D array to represent the graph's edges
    node_t *  nodes;          // Array of nodes
    size_t    num_nodes;      // Number of nodes in the graph
    bool      is_directed;    // Flag indicating whether the graph is directed
    CMP_F     custom_compare; // A custom function to compare node data
    FREE_F    custom_free;    // A custom function to free node data
};

/*** end of file ***/
