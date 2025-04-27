#include <stdio.h>

char *remnth(char *s, int n);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; i+=2)
    {
        int x;
        if (sscanf(argv[i + 1], "%d", &x))
            printf("arg %d is number %d\n", i, x);
        else
        {
            printf("wrong argument %d\n", i);
            return 0;
        }

        printf("%s %d", argv[i], x);
        printf(" -> %s\n", remnth(argv[i], x));
    }
    return 0;
}
