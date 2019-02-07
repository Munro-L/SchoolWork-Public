#include <stdio.h>

//NOT WORKING :(
int main2() {
	int i;
	int j;
	
	//declare array and assign a bunch of values
	int A[10];
	for (i = 0; i <= 9; i++) {
		A[i] = i;
	}
	
	//declare dank as shit pointer
	int *pointer = A[0];	//no & needed because A[0] already points to first element
	
	//iterate through array with pointer and spit out values
	for (j = 0; j <= 9; j++) {
		printf("The value stored in A[%d] is %d.\n", j, *pointer);
		pointer++;
	}
}