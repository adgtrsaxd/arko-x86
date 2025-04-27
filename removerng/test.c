#include <stdio.h>

char *removerng(char *s, char a, char b);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; i+=3)
    {
        printf("%s %s %s", argv[i], argv[i + 1], argv[i + 2]);
        printf(" -> %s\n", removerng(argv[i], argv[i + 1][0], argv[i + 2][0]));
    }
    return 0;
}
