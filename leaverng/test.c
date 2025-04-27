#include <stdio.h>

char *leaverng(char *s, char a, char b);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; i+=3)
    {
        printf("%s %s %s", argv[i], argv[i + 1], argv[i + 2]);
        printf(" -> %s\n", leaverng(argv[i], argv[i + 1][0], argv[i + 2][0]));
    }
    return 0;
}
