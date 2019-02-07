/* SYSC 2006 Fall 2016 Lab 9 */

/* Test harness to exercise the functions in the singly_linked_list.c module.
   Version 1.00 - dlb 
 */

#include <assert.h>  // assert
#include <stdlib.h>  // malloc, free
#include <stdbool.h>
#include <stdio.h>   // printf

#include "singly_linked_list.h"

/* Returns a pointer to the head of the new linked list:
   1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9
 */
intnode_t *setup(void)
{
    intnode_t *head = NULL;  // start with an empty list
    head = push(head, 9);
    head = push(head, 8);
    head = push(head, 7);
    head = push(head, 6);
    head = push(head, 5);
    head = push(head, 4);
    head = push(head, 3);
    head = push(head, 2);
    head = push(head, 1);
    return head;
}

/* Free all the nodes in the linked list pointed to by head. */ 
void teardown(intnode_t *head)
{
    intnode_t *current;
    intnode_t *node_to_delete;
    for (current = head; current != NULL;) {
        node_to_delete = current;
        current = current->next;
        free(node_to_delete);
    }
}


/* Tests for Exercise 1. */

void test_insert(void)
{
    printf("=== Exercise 1: Testing insert ===\n\n");

	intnode_t *list1 = NULL;  // An empty linked list.

	printf("Calling insert with list: ");
    print_list(list1);
    printf("\nInserting 10 at index 0.\n");
	list1 = insert(list1, 0, 10);
	printf("Expected list:\t10\n");
    printf("Actual list:\t");
    print_list(list1);
	printf("\n\n");

	printf("Calling insert with list: ");
    print_list(list1);
    printf("\nInserting 20 value at index 0.\n");
	list1 = insert(list1, 0, 20);
	printf("Expected list:\t20 -> 10\n");
    printf("Actual list:\t");
    print_list(list1);
	printf("\n\n");

	printf("Calling insert with list: ");
    print_list(list1);
    printf("\nInserting 30 at index 1.\n");
	list1 = insert(list1, 1, 30);
	printf("Expected list:\t20 -> 30 -> 10\n");
    printf("Actual list:\t");
    print_list(list1);
	printf("\n\n");

	printf("Calling insert with list: ");
    print_list(list1);
    printf("\nInserting 40 at index 3.\n");
	list1 = insert(list1, 3, 40);
	printf("Expected list:\t20 -> 30 -> 10 -> 40\n");
    printf("Actual list:\t");
    print_list(list1);
	printf("\n\n");
}

/* Tests for Exercise 2. */

void test_alternating_split(void)
{
    printf("=== Exercise 2: Testing alternating_split ===\n\n");

    // Test empty list.
    intnode_t *head = NULL;  
    printf("Calling alternating_split with list: ");
    print_list(head);
    alternating_split(head);
	printf("\nExpected list:\tempty list\n");
    printf("Actual list:\t");
    print_list(head);
	printf("\n\n");

    // Test list with one node.
    head = push(head, 1);
    printf("Calling alternating_split with list: ");
    print_list(head);
    alternating_split(head);
	printf("\nExpected list:\t1\n");
    printf("Actual list:\t");
    print_list(head);
	printf("\n\n");
    teardown(head);

    // Test list with an odd number of nodes.
    head = setup();  // head points to a list with 9 nodes
    printf("Calling alternating_split with list: ");
    print_list(head);
    alternating_split(head);
	printf("\nExpected list:\t1 -> 3 -> 5 -> 7 -> 9\n");
    printf("Actual list:\t");
    print_list(head);
	printf("\n\n");
    teardown(head);

    // Test list with an even number of nodes.
    head = setup();
    head = push(head, 0);  // Now the list has 10 nodes
    printf("Calling alternating_split with list: ");
    print_list(head);
    alternating_split(head);
	printf("\nExpected list:\t0 -> 2 -> 4 -> 6 -> 8\n");
    printf("Actual list:\t");
    print_list(head);
	printf("\n\n");
}

int main(void)
{
	test_insert();
    test_alternating_split();
}
