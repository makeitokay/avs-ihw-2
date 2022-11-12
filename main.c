#include <stdio.h>

char input[10000];
char result[10000];

void convert(int size) {
    int i;
    for (i = 0; i < size; ++i) {
        if (input[i] >= 65 && input[i] <= 90) {
            result[i] = input[i] + 32;
        }
        else if (input[i] >= 97 && input[i] <= 122) {
            result[i] = input[i] - 32;
        }
        else {
            result[i] = input[i];
        }
    }
}

int main() {
    int size = 0;
    int ch;
    do {
        ch = fgetc(stdin);
        input[size++] = ch;
    } while (ch != -1);
    input[size - 1] = '\0';

    convert(size);

    printf("%s", result);
    return 0;
}
