gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf numtohex.s -o numtohex.o
gcc -m32 -g test.o numtohex.o -o numtohex
