gcc -m32 -g -c test.c -o test.o
nasm -f elf32 -g -F dwarf leavelastndig.s -o leavelastndig.o
gcc -m32 -g test.o leavelastndig.o -o leavelastndig
