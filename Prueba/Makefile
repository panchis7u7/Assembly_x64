#makefile
Prueba: Prueba.o
	gcc -o Prueba Prueba.o -no-pie
Prueba.o: Prueba.asm
	nasm -f elf64 -g -F dwarf Prueba.asm -l Prueba.lst

