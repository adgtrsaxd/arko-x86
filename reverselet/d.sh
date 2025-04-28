gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf reverselet.s -o reverselet.o
gcc -m32 -g test.o reverselet.o -o reverselet
