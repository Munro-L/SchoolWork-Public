#include <stdio.h>

int main() {
	//decalre variables and pointers
	int A = 5;
	double B = 42.5;
	int *pointer;
	double *pointer1;
	
	//assign adresses to pointers
	pointer = &A;
	pointer1 = &B;
	
	//format strings must match data type, or things get weird
	printf("The value stored in A is %d, the value stored in B is %f.\n", *pointer, *pointer1);
}
