#include <stdio.h>

unsigned int gethex(char *s);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
    {
        printf("%s", argv[i]);
        printf(" -> %u\n", gethex(argv[i]));
    }
    return 0;
}
