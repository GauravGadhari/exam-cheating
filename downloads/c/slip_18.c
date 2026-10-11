#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int n, temp;
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
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    printf("Sorted Array (Bubble Sort): ");
    for (int i = 0; i < n; i++) printf("%d ", arr[i]);
    printf("\n");
    return 0;
}