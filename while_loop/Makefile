NASM=nasm -f elf
FILE=while

all:    clean compile link

compile:
	$(NASM) $(FILE).asm

link:
	ld -m elf_i386 -s -o $(FILE) $(FILE).o

clean:
	rm -f $(FILE).o

