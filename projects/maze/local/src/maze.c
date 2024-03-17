#include "maze.h"
#include "file_io.h"
#include "utilities.h"

struct cell_t
{
    int row;
    int col;
};

struct maze_t
{
    cell_t   start_p;
    cell_t   end_p;
    uint32_t width;
    uint32_t height;
    char     maze_graph[MAX_ROWS][MAX_COLS];
};

struct path_t
{
    cell_t   cells[MAX_ROWS * MAX_COLS];
    uint32_t path_length;
};

const cell_t NORTH = { -1, 0 };
const cell_t EAST  = { 0, 1 };
const cell_t SOUTH = { 1, 0 };
const cell_t WEST  = { 0, -1 };

int process_maze(const char * filepath_p)
{
    int    exit_code = E_FAILURE;
    maze_t maze      = { 0 };

    if (NULL == filepath_p)
    {
        print_error("process_maze(): NULL argument passed.");
        goto END;
    }

    exit_code = read_maze_from_file(filepath_p, &maze);
    if (E_SUCCESS != exit_code)
    {
        print_error("process_maze(): Unable to read maze from file.");
        goto END;
    }

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

int read_maze_from_file(const char * filepath_p, maze_t * maze_p)
{
    int    exit_code = E_FAILURE;
    FILE * file_p    = NULL;
    char * line_p    = NULL;

    if ((NULL == filepath_p) || (NULL == maze_p))
    {
        print_error("read_maze_from_file(): NULL argument passed.");
        goto END;
    }

    file_p = fopen(filepath_p, "r");
    if (NULL == file_p)
    {
        print_error("read_maze_from_file(): Unable to open file.");
        goto END;
    }

    do
    {
        exit_code = read_line(file_p, &line_p);
        if (E_FAILURE == exit_code)
        {
            print_error(
                "read_maze_from_file(): Unable to read line from file.");
            goto END;
        }
        printf("%s", line_p);
    } while (E_SUCCESS == exit_code);

    exit_code = E_SUCCESS;
END:
    return exit_code;
}

/*** end of file ***/
