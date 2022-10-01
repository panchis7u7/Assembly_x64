#makefile
Imprimir_registros: Imprimir_registros.o
	gcc -o Imprimir_registros Imprimir_registros.o -no-pie
Imprimir_registros.o: Imprimir_registros.asm
	nasm -f elf64 -g -F dwarf Imprimir_registros.asm -l Imprimir_registros.lst
