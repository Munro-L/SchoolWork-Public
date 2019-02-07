#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

_Bool either_24(int arr[], int n) {
    int i;
    _Bool result = false;
    for (i = 0; i < n; i++) {
        if (arr[i] == 2 || arr[i] == 4) {
            if (arr[i] == 2) {
                if (arr[i + 1] == 2) {
                    if (result == false) {
                        result = true;
                    } else {
                        result = false;
                    }
                }
            } else if (arr[i] == 4) {
                if (arr[i + 1] == 4) {
                    if (result == false) {
                        result = true;
                    } else {
                        result = false;
                    }
                }
            }
        }
    }
    return result;
}

int main(void) {
    int arr[3] = {1,3,5};
    int n = 3;
    _Bool result = either_24(arr, n);
    
    printf("result = %d\n", result);
    
    return 0;
}

