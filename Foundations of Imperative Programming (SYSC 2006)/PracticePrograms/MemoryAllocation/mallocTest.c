#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

//test out assert function
int main(void) {
	int *p;
	
	//allocates block in the heap the size of int and stores the adress to pointer p
	p = malloc(sizeof(int));
	assert(p != NULL);
	
	*p = 3;
	
	printf("The value stored in 0x%08x is %d.\n", p, *p);
}
