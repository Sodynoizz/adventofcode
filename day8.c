#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_N 1000
#define abs(x) ((x) < 0 ? -(x) : (x))

typedef struct {
    int r, c;
} Point;

Point p[26][MAX_N];
int cnt[26];
bool a1[MAX_N][MAX_N], a2[MAX_N][MAX_N];
char g[MAX_N][MAX_N];

int main() {
    char *fn = "input/8.in";
    FILE *file = fopen(fn, "r");

    if (!file) {
        printf("Could not open file!\n");
        return 1;
    }

    int r = 0, c = 0;
    while (fgets(g[r], MAX_N, file)) {
        g[r][strcspn(g[r], "\n")] = 0;
        if (c == 0) c = strlen(g[r]);
        r++;
    }
    fclose(file);

    memset(cnt, 0, sizeof(cnt));
    memset(a1, false, sizeof(a1));
    memset(a2, false, sizeof(a2));

    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            if (g[i][j] != '.') {
                int idx = g[i][j] - 'A';
                p[idx][cnt[idx]++] = (Point){i, j};
            }
        }
    }

    int p1 = 0, p2 = 0;

    for (int i = 0; i < r; i++) {
        for (int j = 0; j < c; j++) {
            for (int k = 0; k < 26; k++) {
                for (int l = 0; l < cnt[k]; l++) {
                    for (int m = 0; m < cnt[k]; m++) {
                        if (l != m) {
                            int r1 = p[k][l].r, c1 = p[k][l].c;
                            int r2 = p[k][m].r, c2 = p[k][m].c;

                            int d1 = abs(i - r1) + abs(j - c1);
                            int d2 = abs(i - r2) + abs(j - c2);

                            int dr1 = i - r1, dc1 = j - c1;
                            int dr2 = i - r2, dc2 = j - c2;

                            if ((d1 == 2 * d2 || 2 * d1 == d2) &&
                                0 <= i && i < r && 0 <= j && j < c &&
                                dr1 * dc2 == dc1 * dr2) {
                                if (!a1[i][j]) {
                                    a1[i][j] = true;
                                    p1++;
                                }
                            }

                            if (0 <= i && i < r && 0 <= j && j < c &&
                                dr1 * dc2 == dc1 * dr2) {
                                if (!a2[i][j]) {
                                    a2[i][j] = true;
                                    p2++;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    printf("%d\n%d\n", p1, p2);
    return 0;
}
