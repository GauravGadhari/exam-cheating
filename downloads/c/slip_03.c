#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int n, x, pos = -1;

    printf("Enter size of random array: ");
    if (scanf("%d", &n) != 1) return 0;

    int arr[n];
    srand(time(0));

    printf("Random Array: ");
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 100;
        printf("%d ", arr[i]);
    }
    printf("\n");

    printf("Enter value x to search: ");
    scanf("%d", &x);

    for (int i = 0; i < n; i++) {
        if (arr[i] == x) {
            pos = i;
            break;
        }
    }

    if (pos != -1)
        printf("Element %d found at position %d (index %d)\n", x, pos + 1, pos);
    else
        printf("Element %d is NOT present in the array\n", x);

    return 0;
}