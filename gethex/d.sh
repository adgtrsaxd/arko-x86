gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf gethex.s -o gethex.o
gcc -m32 -g test.o gethex.o -o gethex
