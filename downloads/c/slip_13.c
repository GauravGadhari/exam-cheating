#include <stdio.h>

int binarySearch(int arr[], int n, int x) {
    int low = 0, high = n - 1;
    while (low <= high) {
        int mid = (low + high) / 2;
        if (arr[mid] == x) return mid;
        else if (arr[mid] < x) low = mid + 1;
        else high = mid - 1;
    }
    return -1;
}

int main() {
    int n, x;
    printf("Enter number of sorted elements: ");
    if (scanf("%d", &n) != 1) return 0;

    int arr[n];
    printf("Enter %d sorted elements:\n", n);
    for (int i = 0; i < n; i++) scanf("%d", &arr[i]);

    printf("Enter value to search: ");
    scanf("%d", &x);

    int pos = binarySearch(arr, n, x);
    if (pos != -1)
        printf("Element %d found at position %d (index %d)\n", x, pos + 1, pos);
    else
        printf("Element %d not found in array\n", x);

    return 0;
}