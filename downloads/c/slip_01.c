#include <stdio.h>
#define MAX 100

int stack[MAX];
int top = -1;

int isEmpty() {
    return top == -1;
}

void push(int value) {
    if (top == MAX - 1) {
        printf("Stack Overflow!\n");
        return;
    }
    stack[++top] = value;
}

int pop() {
    if (isEmpty()) {
        printf("Stack Underflow!\n");
        return -1;
    }
    return stack[top--];
}

int main() {
    int n, val;
    printf("Enter number of integers to push: ");
    if (scanf("%d", &n) != 1) return 0;

    printf("Enter %d integers:\n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &val);
        push(val);
    }

    printf("\nPopping elements from stack:\n");
    while (!isEmpty()) {
        printf("%d ", pop());
    }
    printf("\n");
    return 0;
}