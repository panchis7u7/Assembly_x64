registros: registros.o
	gcc -o registros registros.o -no-pie
registros.o: registros.asm
	nasm -f elf64 -g -F dwarf registros.asm -l registros.lst
