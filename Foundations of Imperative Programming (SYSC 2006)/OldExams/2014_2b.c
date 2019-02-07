#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int *series_up(int n) {
    int i;
    int j;
    int size = (n * (n + 1)) / 2;
    int *ptr = malloc(sizeof(int) * size);
    assert(ptr != NULL);
    
    int index = 0;
    for (i = 1; i <= n; i++) {
        for (j = 1; j <= i; j++) {
            ptr[index] = j;
            index++;
        }
    }
    return ptr;
}


int main(void) {
    int n = 5;
    int *arr = series_up(n);
    int size = (n * (n + 1)) / 2;
    int i;
    
    for (i = 0; i < size; i++) {
        printf("result = %d\n", arr[i]);
    }
    
    return 0;
}

