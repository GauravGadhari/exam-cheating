#include <stdio.h>
#define MAX 100

int queue[MAX];
int front = -1, rear = -1;

void initialize() {
    front = -1;
    rear = -1;
}

int isEmpty() {
    return (front == -1 || front > rear);
}

void insert(int value) {
    if (rear == MAX - 1) {
        printf("Queue Overflow!\n");
        return;
    }
    if (front == -1) front = 0;
    queue[++rear] = value;
    printf("Inserted: %d\n", value);
}

void delete() {
    if (isEmpty()) {
        printf("Queue is Empty!\n");
        return;
    }
    printf("Deleted: %d\n", queue[front++]);
}

void display() {
    if (isEmpty()) {
        printf("Queue is empty\n");
        return;
    }
    printf("Queue contents: ");
    for (int i = front; i <= rear; i++) {
        printf("%d ", queue[i]);
    }
    printf("\n");
}

int main() {
    initialize();
    insert(10);
    insert(20);
    insert(30);
    display();
    delete();
    display();
    return 0;
}