#include <stdio.h>

#define FACTORIAL_LIMIT 10 // 宏定义

int factorial(int n);

int global_counter = 0; // 全局变量

int main() {
    int n, result;

    printf("Please enter an integer: ");
    scanf("%d", &n);

    if (n > FACTORIAL_LIMIT) {
        printf("Exceeds limit, maximum supported factorial is %d.\n", FACTORIAL_LIMIT);
        return 1;
    }

    result = factorial(n);
    printf("Factorial of %d is: %d\n", n, result);
    printf("The function was called %d times\n", global_counter);

    return 0;
}

// 递归实现
int factorial(int n)
{
    global_counter++;
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}