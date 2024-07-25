#include <stdio.h>
#include <stdlib.h>

int factorial(int n) {
    if (n == 0) {
        return 1; // Base case: 0! = 1
    } else {
        return n * factorial(n - 1);
    }
}

int main(void) {
    int val = factorial(4);
    printf("%d! = %d\n", 4, val);

    return 0;
}

