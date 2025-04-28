#include <stdio.h>

char *numtohex(unsigned int s);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
    {
        unsigned int x;
        if (sscanf(argv[i], "%d", &x))
            printf("arg %d is number %d\n", i, x);
        else
        {
            printf("wrong argument %d\n", i);
            return 0;
        }

        printf("%d", x);
        printf(" -> %s\n", numtohex(x));
    }
    return 0;
}
