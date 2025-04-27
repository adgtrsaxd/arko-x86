gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf removerng.s -o removerng.o
gcc -m32 -g test.o removerng.o -o removerng
