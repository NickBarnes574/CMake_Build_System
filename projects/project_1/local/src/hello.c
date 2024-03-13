#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "adjacency_list.h"
#include "comparisons.h"
#include "utilities.h"

void node_free(void * data_p)
{
    (void)data_p;
    // free(data_p);
    return;
}

int main()
{
    int exit_code = E_FAILURE;

    graph_t * graph = graph_create(node_free, int_comp);
    if (NULL == graph)
    {
        printf("NULL graph mofo!\n");
        goto END;
    }

    char ** letters = calloc(4, sizeof(char *));

    letters[0] = "A";
    letters[1] = "B";
    letters[2] = "C";
    letters[3] = "D";

    size_t graph_size = 0;

    // Add nodes
    printf("\nADDING NODES...\n\n");
    exit_code = graph_add_node(graph, (void *)letters[0]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }
    exit_code = graph_add_node(graph, (void *)letters[1]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }
    exit_code = graph_add_node(graph, (void *)letters[2]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }
    exit_code = graph_add_node(graph, (void *)letters[3]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }

    // Add edges
    printf("\nADDING EDGES...\n\n");
    exit_code =
        graph_add_edge(graph, (void *)letters[0], (void *)letters[1], 1, false);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add edge.");
        goto END;
    }
    exit_code =
        graph_add_edge(graph, (void *)letters[1], (void *)letters[2], 1, false);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add edge.");
        goto END;
    }
    exit_code =
        graph_add_edge(graph, (void *)letters[2], (void *)letters[3], 1, false);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add edge.");
        goto END;
    }

    printf("\nREMOVING EDGES...\n\n");
    exit_code =
        graph_remove_edge(graph, (void *)letters[0], (void *)letters[1]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to remove edge.");
        goto END;
    }
    exit_code =
        graph_remove_edge(graph, (void *)letters[1], (void *)letters[2]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to remove edge.");
        goto END;
    }
    exit_code =
        graph_remove_edge(graph, (void *)letters[2], (void *)letters[3]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to remove edge.");
        goto END;
    }

    printf("\nGETTING GRAPH SIZE...\n\n");
    graph_size = graph_get_size(graph);
    printf("graph_size %ld\n", graph_size);

    // Clean up
    printf("\nDESTROYING GRAPH...\n\n");
    exit_code = graph_destroy(&graph);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to destroy graph.");
        goto END;
    }

    free(letters);
    letters = NULL;

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

/*** end of file ***/
