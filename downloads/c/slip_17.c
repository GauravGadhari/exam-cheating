#include <stdio.h>
#include <string.h>
#define MAX 100

int stack_int[MAX]; int top_int = -1;
void push_int(int val) { stack_int[++top_int] = val; }
int pop_int() { return stack_int[top_int--]; }

char stack_char[MAX]; int top_char = -1;
void push_char(char c) { stack_char[++top_char] = c; }
char pop_char() { return stack_char[top_char--]; }

int main() {
    int n, val;
    printf("Enter number of integers: ");
    scanf("%d", &n);
    printf("Enter %d integers:\n", n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &val);
        push_int(val);
    }
    printf("Popped integers: ");
    while (top_int != -1) printf("%d ", pop_int());
    printf("\n");

    char str[MAX];
    printf("\nEnter string to reverse: ");
    scanf(" %[^\n]", str);
    for (int i = 0; i < strlen(str); i++) push_char(str[i]);

    printf("Reversed string: ");
    while (top_char != -1) printf("%c", pop_char());
    printf("\n");
    return 0;
}