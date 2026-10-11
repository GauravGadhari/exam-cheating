#include <stdio.h>
#define MAX 100

int queue[MAX];
int front = -1, rear = -1;

void insert(int val) {
    if (rear < MAX - 1) {
        if (front == -1) front = 0;
        queue[++rear] = val;
    }
}

void delete() {
    if (front != -1 && front <= rear) {
        printf("Deleted: %d\n", queue[front++]);
    }
}

int search(int x) {
    for (int i = front; i <= rear; i++) {
        if (queue[i] == x) return i;
    }
    return -1;
}

void display() {
    if (front == -1 || front > rear) {
        printf("Queue is empty\n");
        return;
    }
    printf("Queue: ");
    for (int i = front; i <= rear; i++) printf("%d ", queue[i]);
    printf("\n");
}

int main() {
    int n, val, target;
    printf("Enter number of elements: ");
    scanf("%d", &n);
    printf("Enter %d elements:\n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &val);
        insert(val);
    }
    display();

    printf("Enter element to search: ");
    scanf("%d", &target);
    int pos = search(target);
    if (pos != -1) printf("Found %d at index %d\n", target, pos);
    else printf("%d not in queue\n", target);

    delete();
    display();
    return 0;
}