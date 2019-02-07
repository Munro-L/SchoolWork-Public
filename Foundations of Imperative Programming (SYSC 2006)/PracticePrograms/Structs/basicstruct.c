#include <stdio.h>

int main(void) {
	struct frac {
		int num;
		int den;
	};		//FUCKING SEMICOLONS
	
	struct frac frac1 = {5,3};	//initializes frac1, which is a struct of type frac, storing 5 and 3
	
	printf("frac1 contains %d/%d.\n", frac1.num, frac1.den);
}
