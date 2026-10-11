#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int n, min_idx, temp;
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

    for (int i = 0; i < n - 1; i++) {
        min_idx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_idx])
                min_idx = j;
        }

        temp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = temp;
    }

    printf("Sorted Array (Selection Sort): ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}