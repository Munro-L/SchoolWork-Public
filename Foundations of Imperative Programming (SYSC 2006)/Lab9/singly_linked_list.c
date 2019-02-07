/* SYSC 2006 Fall 2016 Lab 9
   A module that implements a singly-linked list of integers. 
 */

#include <assert.h>             // assert
#include <stdlib.h>             // malloc, free
#include <stdbool.h>
#include <stdio.h>              // printf

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
    assert(p != NULL);
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
    for (intnode_t * current = head; current != NULL; current = current->next) {
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
 * Solutions to Lab 9
 *****************************************************************/

// Exercise 1

intnode_t *insert(intnode_t *head, int index, int x) {
    assert(index >= 0 && index <= length(head));
    intnode_t *current = head;
    intnode_t *previous = head;     //initialized to head, gets lagged behind current by 1 inside loop
    intnode_t *temp;
    intnode_t *newNode;
    int i;
    
    if (head == NULL) {
        head = intnode_construct(x, NULL);
    } else if (index == 0) {
        temp = head;
        head = intnode_construct(x, temp);
    } else if (index == length(head)) {
        newNode = intnode_construct(x, NULL);
        while(current->next != NULL) {    //finds last node in list
            current = current->next;    //makes last node point to new node
        }
        current->next = newNode;
    } else {
        for (i = 0; i <= index; i++) {
            if (i == index) {
                temp = current;
                newNode = intnode_construct(x, temp);
                previous->next = newNode;
            }
            current = current->next;    //advances to next node
            if (i > 0) {
                previous = previous->next;  //should always be one node behind current
            }
        }
    }
    
    return head;
}

// Exercise 2

void alternating_split(intnode_t *head) {
    int i = 0;
    intnode_t *current = head;
    intnode_t *temp;

    while (current != NULL) {
        if (i % 2 == 0) {   //even node
            if (current->next != NULL) {
                temp = current->next;
                current->next = current->next->next;
                free(temp);
            } else {
                temp = current->next;
                current->next = NULL;
                free(temp);
            }
        }
        current = current->next;
    }
}
