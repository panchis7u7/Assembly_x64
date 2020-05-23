section .data
	var1 db 255,40,255
	var2 db 65
section .bss
	prueba resq 1
section .text
global main

main:
	push rbp
	mov rbp, rsp
	
	xor rbx, rbx
	xor rcx, rcx
	lea rbx, [var1]
	lea rcx, [rbx+1]
	xor rdx, rdx
	mov dl, [var2]
	mov [rcx], dl
	
	mov rsp, rbp ;leave
	pop rbp
ret
