#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

struct intnode {
    int value;
    struct intnode *next;
};

typedef struct intnode Intnode;

Intnode *intnode_construct(int value, Intnode *next) {
    Intnode *p = malloc(sizeof(Intnode));
    assert(p != NULL);
    p->value = value;
    p->next = next;
    return p;
}

Intnode *interleave_lists(Intnode *head_1, Intnode *head_2) {
    assert(head_1 != NULL && head_2 != NULL);
    int sizeHead1 = 0;
    int sizeHead2 = 0;
    int greatest;
    int i;
    Intnode *newHead;
    Intnode *current;   //used for finding size of the given lists
    Intnode *current1 = head_1;     //used for building the new list
    Intnode *current2 = head_2;     //used for building the new list
    Intnode *newCurrent;            //used for building the new list
    
    //size of first list
    current = head_1;
    while(current != NULL) {
        sizeHead1++;
        current = current->next;
    }
    
    //size of second list
    current = head_2;
    while(current != NULL) {
        sizeHead2++;
        current = current->next;
    }

    //checks for special cases
    if (sizeHead1 == 0 && sizeHead2 ==0) {
        return NULL;
    } else if (sizeHead1 == 0) {
        return head_2;
    } else if (sizeHead2 == 0) {
        return head_1;
    }

    //finds which list is bigger
    if (sizeHead1 > sizeHead2) {
        greatest = sizeHead1;
    } else {
        greatest = sizeHead2;   //if they are the same size, it doesn't matter which is greatest
    }

    //generates the new list up
    for (i = 0; i < greatest; i++) {
        if (i == 0) {
            Intnode *newHead = intnode_construct(current1->value, NULL);
            Intnode *newCurrent = newHead;
            newCurrent->next = intnode_construct(current2->value, newCurrent);
            newCurrent = newCurrent->next;
        } else if (i > 0) {
            if (current1 != NULL) {
                newCurrent->next = intnode_construct(current1->value, newCurrent);
                newCurrent = newCurrent->next;
            }
            if (current1 != NULL) {
                newCurrent->next = intnode_construct(current2->value, newCurrent);
                newCurrent = newCurrent->next;
            }
        }
        if (current1 != NULL) {
            current1 = current1->next;
        }
        if (current1 != NULL) {
            current2 = current2->next;
        }
    }
    return newHead;     //returns the new list, old lists are untouched
}



int main(void) {
    
    return 0;
}

