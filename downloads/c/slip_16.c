#include <stdio.h>
#include <string.h>

struct City {
    char name[50];
    int std_code;
};

void displayCities(struct City c[], int n) {
    printf("\nCities & STD Codes:\n");
    for (int i = 0; i < n; i++) {
        printf("%-12s -> STD: %d\n", c[i].name, c[i].std_code);
    }
}

int searchCity(struct City c[], int n, char target[]) {
    for (int i = 0; i < n; i++) {
        if (strcmp(c[i].name, target) == 0)
            return c[i].std_code;
    }
    return -1;
}

int main() {
    struct City cities[5] = {
        {"Pune", 20}, {"Mumbai", 22}, {"Delhi", 11}, {"Nashik", 253}, {"Nagpur", 712}
    };
    int n = 5;
    char searchName[50];

    displayCities(cities, n);

    printf("\nEnter city name to search: ");
    if (scanf(" %[^\n]", searchName) != 1) return 0;

    int code = searchCity(cities, n, searchName);
    if (code != -1)
        printf("Found! The STD code for %s is %d\n", searchName, code);
    else
        printf("City not in the list\n");

    return 0;
}