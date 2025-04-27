gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf remlastnum.s -o remlastnum.o
gcc -m32 -g test.o remlastnum.o -o remlastnum
