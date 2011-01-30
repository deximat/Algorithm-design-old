/*
 PROG: packrec
 LANG: C++
 ID: deximat1
 */
#include <stdio.h>
#include <limits.h>

#define veca 0
#define manja 1

inline int veciod(int aa, int ba) {
    if (aa > ba)
        return aa;
    else
        return ba;
}
FILE *in, *out;
int povecima[3][4], pomanjima[2][4];
int resenja[2][2000], resenja2[2][30], velicina = INT_MAX;

int main() {
    in = fopen("packrec.in", "r");
    out = fopen("packrec.out", "w");
    int a, b, i = 0;
    while (fscanf(in, "%d %d", &a, &b) != EOF) {

        if (a > b) {
            povecima[veca][i] = a;
            pomanjima[veca][i] = a;
            povecima[2][i] = a;
            pomanjima[2][i] = a;
            povecima[manja][i] = b;
            pomanjima[manja][i] = b;
        } else {
            povecima[veca][i] = b;
            pomanjima[veca][i] = b;
            povecima[2][i] = b;
            pomanjima[2][i] = b;
            povecima[manja][i] = a;
            pomanjima[manja][i] = a;
        }
        i++;
    }
    int j;

    int c, d, ar, br, cr, dr;
    i = 0;

    int x = 0, y = 0;
    for (a = 0; a <= 3; a++)
        for (b = 0; b <= 3; b++)
            for (c = 0; c <= 3; c++)
                for (d = 0; d <= 3; d++)
                    for (ar = 0; ar <= 1; ar++)
                        for (br = 0; br <= 1; br++)
                            for (cr = 0; cr <= 1; cr++)
                                for (dr = 0; dr <= 1; dr++)
                                    if ((a != b) && (a != c) && (a != d) && (b != c) && (b != d) && (c != d)) {
                                        //prvi slucaj
                                        x = veciod(povecima[dr + veca][d], povecima[ar + manja][a] + povecima[br + manja][b] + povecima[cr + manja][c]);
                                        y = povecima[dr + manja][d] + veciod(veciod(povecima[ar + veca][a], povecima[br + veca][b]), povecima[cr + veca][c]);
                                        if (velicina >= x * y) {
                                            if (velicina == x * y)
                                                i++;
                                            else {
                                                velicina = x*y;
                                                i = 0;
                                            }
                                            resenja[0][i] = x;
                                            resenja[1][i] = y;
                                        }
                                        //drugi slucaj
                                        x = povecima[cr + manja][c] + veciod(povecima[dr + veca][d], povecima[ar + manja][a] + povecima[br + manja][b]);
                                        y = veciod(povecima[cr + veca][c], povecima[dr + manja][d] + veciod(povecima[ar + veca][a], povecima[br + veca][b]));
                                        if (velicina >= x * y) {
                                            if (velicina == x * y)
                                                i++;
                                            else {
                                                velicina = x*y;
                                                i = 0;
                                            }
                                            resenja[0][i] = x;
                                            resenja[1][i] = y;
                                        }
                                        //treci slucaj
                                        x = povecima[ar + manja][a] + veciod(povecima[br + manja][b], povecima[cr + manja][c]) + povecima[dr + manja][d];
                                        y = veciod(veciod(povecima[ar + veca][a], povecima[dr + veca][d]), povecima[br + veca][b] + povecima[cr + veca][c]);
                                        if (velicina >= x * y) {
                                            if (velicina == x * y)
                                                i++;
                                            else {
                                                velicina = x*y;
                                                i = 0;
                                            }
                                            resenja[0][i] = x;
                                            resenja[1][i] = y;
                                        }
                                        //cetvrti slucaj
                                        y = veciod(povecima[cr + veca][c] + povecima[dr + manja][d], povecima[ar + veca][a] + povecima[br + veca][b]);
                                        x = veciod(povecima[ar + manja][a], povecima[br + manja][b]) + veciod(povecima[dr + veca][d], povecima[manja + cr][c]);
                                        if (velicina >= x * y) {
                                            if (velicina == x * y)
                                                i++;
                                            else {
                                                velicina = x*y;
                                                i = 0;
                                            }
                                            resenja[0][i] = x;
                                            resenja[1][i] = y;
                                        }
                                        //peti slucaj
                                        if ((povecima[br + veca][b] <= povecima[cr + veca][c]) && (povecima[cr + manja][c] <= povecima[dr + veca][d])) {
                                            x = veciod(povecima[ar + manja][a] + povecima[dr + veca][d], povecima[br + manja][b] + povecima[cr + manja][c]);
                                            y = veciod(povecima[veca + ar][a] + povecima[veca + br][b], povecima[cr + veca][c] + povecima[dr + manja][d]);
                                        } else {
                                            x = veciod(veciod(povecima[ar + manja][a], povecima[br + veca][b]), povecima[dr + manja][d] + povecima[cr + veca][c]);
                                            y = povecima[ar + veca][a] + povecima[br + manja][b] + veciod(povecima[cr + manja][c], povecima[dr + veca][d]);
                                        }
                                        if (velicina >= x * y) {
                                            if (velicina == x * y)
                                                i++;
                                            else {
                                                velicina = x*y;
                                                i = 0;
                                            }
                                            resenja[0][i] = x;
                                            resenja[1][i] = y;
                                        }
                                        y = veciod(veciod(povecima[ar + veca][a], povecima[br + veca][b]), veciod(povecima[cr + veca][c], povecima[dr + veca][d]));
                                        x = povecima[ar + manja][a] + povecima[br + manja][b] + povecima[cr + manja][c] + povecima[dr + manja][d];
                                        if (velicina >= x * y) {
                                            if (velicina == x * y)
                                                i++;
                                            else {
                                                velicina = x*y;
                                                i = 0;
                                            }
                                            resenja[0][i] = x;
                                            resenja[1][i] = y;
                                        }
                                    }


    int n = 0;
    int temp;

    for (a = 0; a <= i; a++)
        if (resenja[0][a] > resenja[1][a]) {

            temp = resenja[0][a];
            resenja[0][a] = resenja[1][a];
            resenja[1][a] = temp;
        }
    for (a = 0; a <= i; a++)
        for (j = 0; j < i; j++)
            if (resenja[0][j] > resenja[0][j + 1]) {
                int temp;
                temp = resenja[0][j];
                resenja[0][j] = resenja[0][j + 1];
                resenja[0][j + 1] = temp;
                temp = resenja[1][j];
                resenja[1][j] = resenja[1][j + 1];
                resenja[1][j + 1] = temp;
            }
    resenja2[0][1] = resenja[0][0];
    resenja2[1][1] = resenja[1][0];
    n = 1;
    for (a = 1; a <= i; a++)
        if ((resenja[0][a] != resenja[0][a - 1]) || (resenja[1][a] != resenja[1][a - 1])) {
            n++;
            resenja2[0][n] = resenja[0][a];
            resenja2[1][n] = resenja[1][a];
        }
    fprintf(out, "%d\n", velicina);
    for (a = 1; a <= n; a++) fprintf(out, "%d %d\n", resenja2[0][a], resenja2[1][a]);
    fclose(in);
    fclose(out);
}
