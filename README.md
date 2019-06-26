nasm -f elf while.asm

ld -m elf_i386 -s -o while while.o

./while
