all: nasm

nasm: compile exec clear

compile:
	nasm -f elf -o test.o test.s
	ld -m elf_i386 -o test test.o 

exec:
	./test

clear:
	rm *o
	rm test