#include <stdio.h>
#include <stdlib.h>
#include <conio.h> // For _kbhit() and _getch()
#include <windows.h> // For Sleep()
#include <time.h>

#define WIDTH 60
#define HEIGHT 20
#define PIPE_GAP 4
#define PIPE_SPEED 1

typedef struct {
    int x, y;
} Bird;

typedef struct {
    int top, bottom, x;
} Pipe;

void clear_screen() {
    system("cls"); // Clears the screen in Windows
}

void draw(char grid[HEIGHT][WIDTH]) {
    clear_screen();

    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            printf("%c", grid[i][j]);
        }
        printf("\n");
    }
}

void update_grid(char grid[HEIGHT][WIDTH], char* gridString, Bird *bird, Pipe *pipe, int *score) {
    // Clear the grid
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            if (i == HEIGHT - 1) {
                grid[i][j] = '_';
            }
            else grid[i][j] = ' ';
        }
    }

    // Draw bird
    grid[bird->y][bird->x] = 'O';

    // Draw pipe
    for (int i = 0; i < HEIGHT; i++) {
        if (i < pipe->top || i > pipe->bottom) {
            if (pipe->x >= 0 && pipe->x < WIDTH) {
                grid[i][pipe->x] = '#';
            }
        }
    }

    // Check for collisions
    if (bird->y < 0 || bird->y >= HEIGHT || (pipe->x == bird->x &&
        (bird->y < pipe->top || bird->y > pipe->bottom))) {
        printf("\nGame Over! Your score: %d\n", *score);
        getchar();
        exit(0);
    }

    // Check if the bird passed the pipe
    if (pipe->x + 1 == bird->x) {
        (*score)++;
    }

    // Populate gridString
    for (int i = 0; i < HEIGHT; i++) {
        for (int j = 0; j < WIDTH; j++) {
            gridString[i * (WIDTH + 1) + j] = grid[i][j];
        }
        gridString[i * (WIDTH + 1) + WIDTH] = '\n';
    }
    gridString[(WIDTH + 1) * HEIGHT] = '\0'; // Null-terminate the string
}

int main() {
    srand((unsigned int)time(NULL));

    char grid[HEIGHT][WIDTH];
    Bird bird = {5, HEIGHT / 2};
    Pipe pipe = {rand() % (HEIGHT - PIPE_GAP), rand() % (HEIGHT - PIPE_GAP) + PIPE_GAP, WIDTH - 1};
    int score = 0;

    int gravity = 1, gravityDelay = 2, flap = 3;

    while (1) {
        // Input handling
        if (_kbhit()) { // Check if a key is pressed
            char key = _getch(); // Read the key
            if (key == ' ' && (bird.y - 3) >= 0) { // Spacebar for flapping
                bird.y -= 3;
            }
        }

        // Update bird position
        if (gravityDelay <= 0){
            bird.y += gravity;
            gravityDelay = 2;
        }
        else{
            gravityDelay--;
        }

        // Update pipe position
        pipe.x -= PIPE_SPEED;
        if (pipe.x < -1) {
            pipe.x = WIDTH - 1;
            pipe.top = rand() % (HEIGHT - PIPE_GAP);
            pipe.bottom = pipe.top + PIPE_GAP;
        }

        // Update grid
        char* gridString = (char*)malloc(((WIDTH + 1) * HEIGHT) * sizeof(char));
        update_grid(grid, gridString,&bird, &pipe, &score);

        // Render
        clear_screen();
        printf("%s", gridString);

        // Display score
        printf("Score: %d\n", score);

        // Delay for frame rate
        Sleep(10); // Windows equivalent of usleep(100000)
    }

    return 0;
}
