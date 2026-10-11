#include <stdio.h>
#define MAX 100

int stack[MAX];
int top = -1;

int isEmpty() { return top == -1; }

void push(int val) {
    if (top < MAX - 1) stack[++top] = val;
}

int pop() {
    if (isEmpty()) return -1;
    return stack[top--];
}

int main() {
    int n, val;
    printf("Enter number of integers: ");
    if (scanf("%d", &n) != 1) return 0;

    printf("Enter %d integers:\n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &val);
        push(val);
    }

    printf("Popping elements using isEmpty():\n");
    while (!isEmpty()) printf("%d ", pop());
    printf("\n");
    return 0;
}