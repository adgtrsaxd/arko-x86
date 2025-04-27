gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf getdec.s -o getdec.o
gcc -m32 -g test.o getdec.o -o getdec
