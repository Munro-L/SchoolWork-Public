/* SYSC 2006 Fall 2016 Lab 8
   A module that implements a singly-linked list of integers. 
 */

#include <assert.h>  // assert
#include <stdlib.h>  // malloc, free
#include <stdbool.h>
#include <stdio.h>   // printf

#include "singly_linked_list.h"

/*************************************************************
 * Functions presented in lectures.
 *************************************************************/

/* Return a pointer to a new intnode_t (a node in a singly-linked list).

   Parameter value: the integer to be stored in the node.
   Parameter next: a pointer to the node that the new node should point to.
   This pointer should be NULL if the new node is the last node in the 
   linked list.
   Terminate (via assert) if memory for the node cannot be allocated.
 */ 
intnode_t *intnode_construct(int value, intnode_t *next)
{
    intnode_t *p = malloc(sizeof(intnode_t));
    assert (p != NULL);
    p->value = value;
    p->next = next;
    return p;
}
/* Parameter head points to the first node in a linked list, or is NULL
   if the linked list is empty. Insert a node containing the specified 
   integer value at the front of the linked list, and return a pointer to 
   the first node in the modified list.
 */
intnode_t *push(intnode_t *head, int value)
{
    return intnode_construct(value, head);
}

/* Parameter head points to the first node in the list.
   Return the length of a linked list (0 if the linked list is empty). 
 */
int length(intnode_t *head)
{
    int count = 0;
    for(intnode_t *current = head; current != NULL; current = current->next)
    {
        count += 1;       
    }
    return count;
}

/* Parameter head points to the first node in a linked list.
   Print the linked list, using the format:
       value1 -> value2 -> value3 -> ... -> last_value
 */
void print_list(intnode_t *head)
{
    if (head == NULL) {
		printf("empty list");
		return; 
 	}

	intnode_t *current;

	/* Print every node in the linked list except the last one.

       Notice that the loop condition is:
           current->next != NULL
       and not:
           current != NULL

       During the last iteration, the value in the second-last node is
       printed, then current is updated to point to the last node. The
       condition current->next != NULL now evaluates to false, so the 
       loop exits, with current pointing to the last node (which has  
       not yet been printed.) 
	 */
	for (current = head; current->next != NULL; current = current->next) {
		printf("%d -> ", current->value);
	}

	/* Print the last node. */
	printf("%d", current->value);
}



/*****************************************************************
 * Solutions to Lab 8
 *****************************************************************/

// Exercise 1

/* Parameter head points to the first node in a linked list, or is
 * NULL if the list is empty.
 * Count the number of nodes in the linked list that contain an integer
 * equal to target, and return that count. 
 * Return 0 if the linked list is empty.
 */ 
int count(intnode_t *head, int target) {
    int count = 0;
    intnode_t *current = head;

    while (current != NULL) {
        if (current->value == target) {
            count++;
        }
        current = current->next;
    }
    return count;
} 

// Exercise 2

/* Parameter head points to the first node in a linked list, or is
 * NULL if the list is empty.
 * Return the index (position) of the first node that contains an 
 * integer equal to target. The first node is at index 0, the second node
 * is at index 1, etc.
 * Return -1 if target is not in the linked list, or if the linked list
 * is empty.
 */

/* There are 3 cases to consider:
   1. The list is empty; return -1.
   2. target is not in the list; return -1.
   3. First occurrence of target is at position i; return i.
 */

int index(intnode_t *head, int target) {
    int index = -1;
    int i = 0;
    intnode_t *current = head;
    while (current != NULL) {
        if (current->value == target) {
            index = i;
            break;
        }
        i++;
        current = current->next;
    }
    return index;
}

// Exercise 3

/* Parameter head points to the first node in a linked list, or is
 * NULL if the list is empty.
 * Return the integer stored in the node at the specified index.
 * The first node is at index 0, the second node is at index 1, etc.
 * The function terminates (via assert) if the linked list is empty or
 * if parameter index is invalid (negative or greater than the number
 * of nodes in the linked list).
 */

/* There are 3 cases to consider:
   1. The list is empty; terminate via assert.
   2. index is valid (0 <= index < # of nodes); return value in that node.
   3. index < 0 or index >= # of nodes; terminate via assert.
 */

int fetch(intnode_t *head, int index) {
    assert(head != NULL);
    assert(index >= 0);
    assert(index < length(head));

    int value;
    int i = 0;
    intnode_t *current = head;
    while (current != NULL) {
        if (i == index) {
            value = current->value;
            break;
        }
        current = current->next;
        i++;
    }

    return value;
}

// Exercise 4

/* Parameter head points to the first node in a linked list, or is
 * NULL if the list is empty.
 * The function terminates (via assert) if the linked list is empty. 
 * Copy the value in the head node to the location pointed to by
 * parameter popped_value, delete the head node, and return a pointer
 * to the first node in the modified list.
 */
intnode_t *pop(intnode_t *head, int *popped_value) {
    *popped_value = head->value;
    intnode_t *temp = head;
    free(head);
    return temp->next;
}
