#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Node* head = NULL;

void insertAtPos(int val, int pos) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = val;
    if (pos == 1) {
        newNode->next = head;
        head = newNode;
        return;
    }
    struct Node* temp = head;
    for (int i = 1; i < pos - 1 && temp != NULL; i++) {
        temp = temp->next;
    }
    if (temp == NULL) {
        free(newNode);
        return;
    }
    newNode->next = temp->next;
    temp->next = newNode;
}

void deleteVal(int val) {
    if (head == NULL) return;
    if (head->data == val) {
        struct Node* temp = head;
        head = head->next;
        free(temp);
        printf("Deleted %d\n", val);
        return;
    }
    struct Node* temp = head;
    while (temp->next && temp->next->data != val) temp = temp->next;
    if (temp->next) {
        struct Node* del = temp->next;
        temp->next = del->next;
        free(del);
        printf("Deleted %d\n", val);
    }
}

void display() {
    struct Node* temp = head;
    printf("Linked List: ");
    while (temp) {
        printf("%d -> ", temp->data);
        temp = temp->next;
    }
    printf("NULL\n");
}

int main() {
    insertAtPos(10, 1);
    insertAtPos(20, 2);
    insertAtPos(15, 2);
    display();
    deleteVal(15);
    display();
    return 0;
}