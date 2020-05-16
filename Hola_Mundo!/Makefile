#makefile
Hola_mundo: Hola_mundo.o
	gcc -o Hola_mundo Hola_mundo.o -no-pie
Hola_mundo.o: Hola_mundo.asm
	nasm -f elf64 -g -F dwarf Hola_mundo.asm -l Hola_mundo.lst
