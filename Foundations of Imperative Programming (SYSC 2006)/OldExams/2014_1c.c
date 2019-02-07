#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <assert.h>

double maclaurin(double x, int k) {
    assert(x <= 1 && x > -1 && k > 0);
    double j = 1;
    int i;
    double sum = 0;
    for (i = 1; i <= k; i++) {
        if (i % 2 == 0) {           //iteration is even
            sum = sum - (pow(x,k) / j);
        } else {                    //iteration is odd
            sum = sum + (pow(x,k) / j);  
        }
        j++;
    }
    return sum;
}

void test_maclaurin(double x, int k, double expected_result) {
    printf("Calling maclaurin, parameter x: %f, parameter k: %f\n", x, k);
    printf("Expected sum: %f\n", expected_result);
    printf("Actual Sum: %f\n", maclaurin(x,k));
    return;
}

int main(void) {
    double x = 0.5;
    int k = 100;
    double expected = 0.4055;
    //double result;
    test_maclaurin(x, k, expected);

    //printf("result = %f\n", result);

    return 0;
}