/* SYSC 2006 Fall 2016 Lab 10 */

/* Test harness to exercise the functions in the circular_intqueue.c module.
   Version 1.00 - dlb 
 */

#include <assert.h>  // assert
#include <stdlib.h>  // malloc, free
#include <stdbool.h>
#include <stdio.h>   // printf

#include "circular_intqueue.h"

void print_bool(_Bool value)
{
    if (value) {
        printf("true");
    } else {
        printf("false");
    }
}

#ifdef notdef

/* Returns a pointer to the new queue: [1, 2, 3, 4]
 * 1 is at the front of the queue, 4 is at the rear.
 */
intqueue_t *build_1_2_3_4(void)
{
    intqueue_t *queue = intqueue_construct();

    intnode_t *head, *tail;


    head = intnode_construct(4, NULL);
    tail = head;
    head = intnode_construct(3, head);
    head = intnode_construct(2, head);
    head = intnode_construct(1, head);
    tail->next = head;

    queue->rear = tail;
    queue->size = 4;
    return queue;
}

void test_print(void)
{
    printf("=== Testing intqueue_print ===\n\n");

    printf("Building an empty queue\n");

    intqueue_t *queue = intqueue_construct();

    printf("Calling intqueue_print\n");
    printf("Expected output: []\n");
    printf("Actual output:   ");
    intqueue_print(queue);
    printf("\n\n");

    printf("Building queue [1]\n");

    queue->rear = intnode_construct(1, NULL);
    queue->rear->next = queue->rear;
    queue->size = 1;

    printf("Calling intqueue_print\n");
    printf("Expected output: [1]\n");
    printf("Actual output:   ");
    intqueue_print(queue);
    printf("\n\n");

    printf("Building queue [1, 2, 3, 4]\n");

    queue = build_1_2_3_4();

    printf("Calling intqueue_print\n");
    printf("Expected output: [1, 2, 3, 4]\n");
    printf("Actual output:   ");
    intqueue_print(queue);
    printf("\n\n");
}
#endif

void test_enqueue(void)
{
    printf("=== Test 1: Testing intqueue_enqueue ===\n\n");
    printf("Building an empty queue\n");
    intqueue_t *queue = intqueue_construct();

    printf("Enqueue'ing 40\n");
    intqueue_enqueue(queue, 40);
    printf("Expected queue: [40]\n");
    printf("Actual queue:   ");
    intqueue_print(queue);
    printf("\n\n");

    printf("Enqueue'ing 30\n");
    intqueue_enqueue(queue, 30);
    printf("Expected queue: [40, 30]\n");
    printf("Actual queue:   ");
    intqueue_print(queue);
    printf("\n\n");

    printf("Enqueue'ing 20\n");
    intqueue_enqueue(queue, 20);
    printf("Expected queue: [40, 30, 20]\n");
    printf("Actual queue:   ");
    intqueue_print(queue);
    printf("\n\n");
}

void test_front(void)
{
    int elem;
    _Bool success;

    printf("=== Test 2: Testing intqueue_front ===\n\n");
    printf("Building an empty queue\n");
    intqueue_t *queue = intqueue_construct();

    printf("Calling intqueue_front\n");
    success = intqueue_front(queue, &elem);

    printf("Expected result: false\n");
    printf("Actual result:   ");
    print_bool(success);
    printf("\n\n");

    printf("Enqueue'ing 40, calling intqueue_front\n");
    intqueue_enqueue(queue, 40);
    success = intqueue_front(queue, &elem);

    printf("Expected result: true, 40\n");
    printf("Actual result:   ");
    print_bool(success);
    printf(", %d", elem);
    printf("\n\n");

    printf("Enqueue'ing 30, calling intqueue_front\n");
    intqueue_enqueue(queue, 30);
    success = intqueue_front(queue, &elem);

    printf("Expected result: true, 40\n");
    printf("Actual result:   ");
    print_bool(success);
    printf(", %d", elem);
    printf("\n\n");

    printf("Enqueue'ing 20, calling intqueue_front\n");
    intqueue_enqueue(queue, 20);
    success = intqueue_front(queue, &elem);

    printf("Expected result: true, 40\n");
    printf("Actual result:   ");
    print_bool(success);
    printf(", %d", elem);
    printf("\n\n");
}

void test_dequeue(void)
{
    int elem;
    _Bool success;

    printf("=== Test 3: Testing intqueue_dequeue ===\n\n");
    printf("Building an empty queue\n");
    intqueue_t *queue = intqueue_construct();

    printf("Calling intqueue_dequeue\n");
    success = intqueue_dequeue(queue, &elem);

    printf("Expected result: false\n");
    printf("Actual result:   ");
    print_bool(success);
    printf("\n\n");

    printf("Enqueue'ing 40, 30, 20\n");
    intqueue_enqueue(queue, 40);
    intqueue_enqueue(queue, 30);
    intqueue_enqueue(queue, 20);
    printf("\n\n");

    printf("Calling intqueue_dequeue\n");
    success = intqueue_dequeue(queue, &elem);

    printf("Expected result: true, 40\n");
    printf("Actual result:   ");
    print_bool(success);
    printf(", %d", elem);
    printf("\n\n");

    printf("Calling intqueue_dequeue\n");
    success = intqueue_dequeue(queue, &elem);

    printf("Expected result: true, 30\n");
    printf("Actual result:   ");
    print_bool(success);
    printf(", %d", elem);
    printf("\n\n");

    printf("Calling intqueue_dequeue\n");
    success = intqueue_dequeue(queue, &elem);

    printf("Expected result: true, 20\n");
    printf("Actual result:   ");
    print_bool(success);
    printf(", %d", elem);
    printf("\n\n");

    printf("Calling intqueue_dequeue\n");
    success = intqueue_dequeue(queue, &elem);

    printf("Expected result: false\n");
    printf("Actual result:   ");
    print_bool(success);
    printf("\n\n");
}


int main(void)
{
    // test_print();
    test_enqueue();
    test_front();
    test_dequeue();
}
