#include <stdio.h>

unsigned int getdec(char *s);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
    {
        printf("%s", argv[i]);
        printf(" -> %u\n", getdec(argv[i]));
    }
    return 0;
}
