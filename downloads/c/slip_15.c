#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int n, key, j;
    printf("Enter number of elements: ");
    if (scanf("%d", &n) != 1) return 0;

    int arr[n];
    srand(time(0));

    printf("Random Array: ");
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 100;
        printf("%d ", arr[i]);
    }
    printf("\n");

    for (int i = 1; i < n; i++) {
        key = arr[i];
        j = i - 1;

        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }

    printf("Sorted Array (Insertion Sort): ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}