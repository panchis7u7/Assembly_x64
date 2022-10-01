#makefile
#gcc -nostdlib -nostartfiles -Wl,--entry=main -o Prueba.out Prueba.o -no-pie
Prueba: Prueba.o
	gcc -o Prueba.out Prueba.o -no-pie
Prueba.o: Prueba.asm
	nasm -felf64 -g Prueba.asm -l Prueba.lst
clean:
	rm -f Prueba.lst Prueba.o Prueba