#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void accept(int arr[], int n) {
    srand(time(0));
    for (int i = 0; i < n; i++) arr[i] = rand() % 100;
}

void display(int arr[], int n) {
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
}

int linearSearch(int arr[], int n, int x) {
    for (int i = 0; i < n; i++) {
        if (arr[i] == x) return i;
    }
    return -1;
}

int main() {
    int n, x;
    printf("Enter size of array: ");
    if (scanf("%d", &n) != 1) return 0;

    int arr[n];
    accept(arr, n);
    printf("Array: ");
    display(arr, n);

    printf("Enter value to search: ");
    scanf("%d", &x);

    int pos = linearSearch(arr, n, x);
    if (pos != -1)
        printf("Element %d found at position %d (index %d)\n", x, pos + 1, pos);
    else
        printf("Element %d not found in array\n", x);

    return 0;
}