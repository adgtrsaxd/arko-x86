gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf remrep.s -o remrep.o
gcc -m32 -g test.o remrep.o -o remrep
