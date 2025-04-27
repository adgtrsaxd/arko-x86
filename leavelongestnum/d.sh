gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf leavelongestnum.s -o leavelongestnum.o
gcc -m32 -g test.o leavelongestnum.o -o leavelongestnum
