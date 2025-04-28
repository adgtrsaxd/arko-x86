gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf reversepairs.s -o reversepairs.o
gcc -m32 -g test.o reversepairs.o -o reversepairs
