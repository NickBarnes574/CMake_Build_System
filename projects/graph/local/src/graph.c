#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "adjacency_list.h"
#include "comparisons.h"
#include "utilities.h"

void print_node_data(const void * data)
{
    printf("%s", (char *)data);
}

void node_free(void * data_p)
{
    (void)data_p;
    // free(data_p);
    return;
}

int main()
{
    int exit_code = E_FAILURE;

    graph_t * graph = graph_create(node_free, str_comp);
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
    exit_code = graph_add_node(graph, letters[0]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }
    exit_code = graph_add_node(graph, letters[1]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }
    exit_code = graph_add_node(graph, letters[2]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }
    exit_code = graph_add_node(graph, letters[3]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add node.");
        goto END;
    }

    graph_print(graph, print_node_data);

    // Add edges
    printf("\nADDING EDGES...\n\n");
    exit_code = graph_add_edge(graph, letters[0], letters[1], 1, true);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add edge.");
        goto END;
    }
    exit_code = graph_add_edge(graph, letters[1], letters[2], 1, true);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add edge.");
        goto END;
    }
    exit_code = graph_add_edge(graph, letters[2], letters[3], 1, true);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to add edge.");
        goto END;
    }

    graph_print(graph, print_node_data);

    printf("\nREMOVING EDGES...\n\n");
    exit_code = graph_remove_edge(graph, letters[0], letters[1]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to remove edge.");
        goto END;
    }
    exit_code = graph_remove_edge(graph, letters[1], letters[2]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to remove edge.");
        goto END;
    }
    exit_code = graph_remove_edge(graph, letters[2], letters[3]);
    if (E_SUCCESS != exit_code)
    {
        print_error("Unable to remove edge.");
        goto END;
    }

    graph_print(graph, print_node_data);

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
