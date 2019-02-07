#include <stdlib.h>
#include <math.h>
#include <stdio.h>

int main(void) {
    int k = 8;
    double i;
    double sum = 0;

    for (i = 1; i <= k; i++) {
        sum = sum + (1 / i);
    }

    printf("sum = %f\n", sum);

    return 0;
}