#include <stdio.h>

char *remdigits(char *s);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
    {
        printf("%s", argv[i]);
        printf(" -> %s\n", remdigits(argv[i]));
    }
    return 0;
}
