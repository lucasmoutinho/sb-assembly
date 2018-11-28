all: nasm

mac: compile_mac exec clear

nasm: compile exec clear

compile:
	nasm -f elf -o test.o test.s
	ld -m elf_i386 -o test test.o 

compile_mac:
	nasm -f elf -o test.o test.s
	ld -m elf_i386 -o test test.o io.o 

exec:
	./test

clear:
	rm test.o
	rm test