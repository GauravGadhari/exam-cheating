#include <stdio.h>
#define MAX 100

int stack[MAX];
int top = -1;

void initialize() { top = -1; }
int isEmpty() { return top == -1; }
int isFull() { return top == MAX - 1; }

void push(int val) {
    if (isFull()) {
        printf("Stack Overflow!\n");
        return;
    }
    stack[++top] = val;
    printf("Pushed: %d\n", val);
}

int pop() {
    if (isEmpty()) {
        printf("Stack Underflow!\n");
        return -1;
    }
    return stack[top--];
}

int peek() {
    if (isEmpty()) return -1;
    return stack[top];
}

int main() {
    initialize();
    push(10);
    push(20);
    push(30);
    printf("Top element (Peek): %d\n", peek());
    printf("Popped element: %d\n", pop());
    printf("Popped element: %d\n", pop());
    printf("Is stack empty? %s\n", isEmpty() ? "Yes" : "No");
    return 0;
}