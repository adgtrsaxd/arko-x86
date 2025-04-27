gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf leaverng.s -o leaverng.o
gcc -m32 -g test.o leaverng.o -o leaverng
