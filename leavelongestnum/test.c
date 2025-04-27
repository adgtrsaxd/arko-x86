#include <stdio.h>

char *leavelongestnum(char *s);

int main(int argc, char *argv[])
{
    for (int i = 1; i < argc; ++i)
    {
        printf("%s", argv[i]);
        printf(" -> %s\n", leavelongestnum(argv[i]));
    }
    return 0;
}
