#include <stdio.h>

//OMFGBBQ it works
int main3(void) {
	int int_var = 5;
	int *int_ptr;
	
	int_ptr = &int_var;		//put the adress of int_var into the pointer
	
	printf("int_var is located at 0x%08x and contains %d.\n", &int_var, int_var);
	printf("int_ptr is located at 0x%08x and contains 0x%08x, and points to %d.\n", &int_ptr, int_ptr, *int_ptr);
}