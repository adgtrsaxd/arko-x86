#include <stdio.h>

char *remrep(char *s);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
    {
        printf("%s", argv[i]);
        printf(" -> %s\n", remrep(argv[i]));
    }
    return 0;
}
