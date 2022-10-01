
# gcc -o test test.o -no-pie
# ld -o test.out -e main test.o

test: test.o
	gcc -nostdlib -nostartfiles -Wl,--entry=main -g -o test.out test.o -no-pie
test.o: test.asm
	yasm -f elf64 -m amd64 -g dwarf2 test.asm -l test.lst
clean:
	rm -f test.lst test.o test.out test