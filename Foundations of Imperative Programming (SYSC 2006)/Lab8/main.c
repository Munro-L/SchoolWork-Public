/* SYSC 2006 Fall 2016 Lab 8 */

/* Test harness to exercise the functions in the singly_linked_list.c module.
   Version 1.03 - dlb 
 */

#include <assert.h>  // assert
#include <stdlib.h>  // malloc, free
#include <stdbool.h>
#include <stdio.h>   // printf

#include "singly_linked_list.h"

/* Returns a pointer to the head of a new linked list:
   1 -> 1 -> 2 -> 3 -> 3 -> 4 -> 5 -> 5 -> 5
 */
intnode_t *setup(void)
{
    intnode_t *head = NULL;  // start with an empty list
    head = push(head, 5);
    head = push(head, 5);
    head = push(head, 5);
    head = push(head, 4);
    head = push(head, 3);
    head = push(head, 3);
    head = push(head, 2);
    head = push(head, 1);
    head = push(head, 1);
    return head;
}

/* Tests for Exercise 1. */
void test_count(intnode_t *head)
{
    printf("=== Exercise 1: Testing count ===\n\n");

    int occurrences;
    intnode_t *empty = NULL; // Empty list

	printf("Calling count with list: ");
    print_list(empty);
    printf("\nCounting 1's.\n");
	occurrences = count(empty, 1);
	printf("Expected result: 0\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(empty);
    printf("\nCounting 7's.\n");
	occurrences = count(empty, 7);
	printf("Expected result: 0\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(head);
    printf("\nCounting 1's.\n");
	occurrences = count(head, 1);
	printf("Expected result: 2\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(head);
    printf("\nCounting 2's.\n");
	occurrences = count(head, 2);
	printf("Expected result: 1\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(head);
    printf("\nCounting 3's.\n");
	occurrences = count(head, 3);
	printf("Expected result: 2\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(head);
    printf("\nCounting 4's.\n");
	occurrences = count(head, 4);
	printf("Expected result: 1\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(head);
    printf("\nCounting 5's.\n");
	occurrences = count(head, 5);
	printf("Expected result: 3\n");
    printf("Actual result: %d\n\n", occurrences);

	printf("Calling count with list: ");
    print_list(head);
    printf("\nCounting 7's.\n");
	occurrences = count(head, 7);
	printf("Expected result: 0\n");
    printf("Actual result: %d\n\n", occurrences);
}

/* Tests for Exercise 2. */
void test_index(intnode_t *head)
{
    printf("=== Exercise 2: Testing index ===\n\n");

    int posn;
    intnode_t *empty = NULL; // Empty list

	printf("Calling index with list: ");
    print_list(empty);
    printf("\nSearching for 1.\n");
	posn = index(empty, 1);
	printf("Expected result: -1\n");
    printf("Actual result: %d\n\n", posn);

	printf("Calling index with list: ");
    print_list(head);
    printf("\nSearching for 1.\n");
	posn = index(head, 1);
	printf("Expected result: 0\n");
    printf("Actual result: %d\n\n", posn);

	printf("Calling index with list: ");
    print_list(head);
    printf("\nSearching for 2.\n");
	posn = index(head, 2);
	printf("Expected result: 2\n");
    printf("Actual result: %d\n\n", posn);

	printf("Calling index with list: ");
    print_list(head);
    printf("\nSearching for 3.\n");
	posn = index(head, 3);
	printf("Expected result: 3\n");
    printf("Actual result: %d\n\n", posn);

	printf("Calling index with list: ");
    print_list(head);
    printf("\nSearching for 4.\n");
	posn = index(head, 4);
	printf("Expected result: 5\n");
    printf("Actual result: %d\n\n", posn);

	printf("Calling index with list: ");
    print_list(head);
    printf("\nSearching for 5.\n");
	posn = index(head, 5);
	printf("Expected result: 6\n");
    printf("Actual result: %d\n\n", posn);

	printf("Calling index with list: ");
    print_list(head);
    printf("\nSearching for 7.\n");
	posn = index(head, 7);
	printf("Expected result: -1\n");
    printf("Actual result: %d\n\n", posn);
}

/* Tests for Exercise 3. */
void test_fetch(intnode_t *head)
{
    printf("=== Exercise 3: Testing fetch ===\n\n");

    /* We can't test these cases, because they should cause fetch
     * to terminate via assert. 
     *
     * 1. The list is empty; terminate via assert.
     * 2. index < 0 or index >= # of nodes; terminate via assert.
     */

    int value;

	printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 0.\n");
	value = fetch(head, 0);
	printf("Expected result: 1\n");
    printf("Actual result: %d\n\n", value);

	printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 1.\n");
	value = fetch(head, 1);
	printf("Expected result: 1\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 2.\n");
	value = fetch(head, 2);
	printf("Expected result: 2\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 3.\n");
	value = fetch(head, 3);
	printf("Expected result: 3\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 4.\n");
	value = fetch(head, 4);
	printf("Expected result: 3\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 5.\n");
	value = fetch(head, 5);
	printf("Expected result: 4\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 6.\n");
	value = fetch(head, 6);
	printf("Expected result: 5\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 7.\n");
	value = fetch(head, 7);
	printf("Expected result: 5\n");
    printf("Actual result: %d\n\n", value);	
    
    printf("Calling fetch with list: ");
    print_list(head);
    printf("\nFetching value at index 8.\n");
	value = fetch(head, 8);
	printf("Expected result: 5\n");
    printf("Actual result: %d\n\n", value);
}

/* Tests for Exercise 4. */
void test_pop(intnode_t *head)
{
    printf("=== Exercise 4: Testing pop ===\n\n");

    /* We can't test the empty-list case, because it should cause pop to
     * terminate via assert.
     */

    int popped;

    printf("Calling pop with list: ");
    print_list(head);
    printf("\n");
	head = pop(head, &popped);
	printf("Expected popped value: 1\n");
    printf("Actual popped value: %d\n", popped);
    printf("Expected list after pop: 1 -> 2 -> 3 -> 3 -> 4 -> 5 -> 5 -> 5\n");
    printf("Actual list after pop:   ");
    print_list(head); 
	printf("\n\n");

    printf("Calling pop with list: ");
    print_list(head);
    printf("\n");
	head = pop(head, &popped);
	printf("Expected popped value: 1\n");
    printf("Actual popped value: %d\n", popped);
    printf("Expected list after pop: 2 -> 3 -> 3 -> 4 -> 5 -> 5 -> 5\n");
    printf("Actual list after pop:   ");
    print_list(head);
	printf("\n\n");

    printf("Calling pop 6 more times (results not shown)\n\n");
    for (int i = 0; i < 6; i += 1) {
        head = pop(head, &popped);
    }

    printf("Calling pop with list: ");
    print_list(head);
    printf("\n");
	head = pop(head, &popped);
	printf("Expected popped value: 5\n");
    printf("Actual popped value: %d\n", popped);
    printf("Expected list after pop: empty list\n");
    printf("Actual list after pop:   ");
    print_list(head);
    printf("\n");
}

int main(void)
{
	intnode_t *head;  
    head = setup();
    // print_list(head);

    test_count(head);
    test_index(head);
    test_fetch(head);
    test_pop(head);
}
