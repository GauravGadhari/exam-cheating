#include <stdio.h>
#include <stdlib.h>

struct Node {
    int data;
    struct Node* next;
};

struct Node* createList(int n) {
    struct Node *head = NULL, *temp = NULL, *newNode = NULL;
    int val;
    for (int i = 0; i < n; i++) {
        newNode = (struct Node*)malloc(sizeof(struct Node));
        printf("Enter element %d: ", i + 1);
        scanf("%d", &val);
        newNode->data = val;
        newNode->next = NULL;
        if (!head) { head = temp = newNode; }
        else { temp->next = newNode; temp = newNode; }
    }
    return head;
}

void display(struct Node* head) {
    while (head) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}

struct Node* concatenate(struct Node* l1, struct Node* l2) {
    if (!l1) return l2;
    struct Node* temp = l1;
    while (temp->next != NULL) {
        temp = temp->next;
    }
    temp->next = l2;
    return l1;
}

int main() {
    int n1, n2;
    printf("Enter count for List 1: ");
    scanf("%d", &n1);
    struct Node* l1 = createList(n1);

    printf("Enter count for List 2: ");
    scanf("%d", &n2);
    struct Node* l2 = createList(n2);

    printf("\nList 1: "); display(l1);
    printf("List 2: "); display(l2);

    l1 = concatenate(l1, l2);
    printf("Concatenated List: "); display(l1);
    return 0;
}