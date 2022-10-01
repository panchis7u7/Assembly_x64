section .data
	var1 db 255,40,255
	var2 db 65 
	MAP_FAILED equ -1
	PROT_READ equ 0x1
	PROT_WRITE equ 0x2
	PROT_EXEC equ 0x4
	PROT_NONE equ 0x0
	MAP_PRIVATE equ 0x2
	MAP_ANONYMOUS equ 0x20
	
section .bss
	prueba resq 1
	
section .text
global main
main:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	;lea rbx, [var1]
	;lea rcx, [rbx+1]
	;xor rdx, rdx
	;mov dl, [var2]
	;mov [rcx], dl
	
	;Prueba MMAP
	mov rax, 9								;mmap syscall no.
	mov rdi, 0								;hint 
	mov rsi, 4096							;page size
	mov rdx, PROT_READ | PROT_WRITE			;Read and write memory
	mov r10, MAP_PRIVATE | MAP_ANONYMOUS	;no shared pages
	mov r8, 0 								;no file descriptor
	mov r9, 0								;no offset
	syscall
	
	mov [rax], byte 0xff
	
	mov rsp, rbp ;leave
	pop rbp
ret
