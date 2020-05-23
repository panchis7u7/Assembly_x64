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
	mov rcx, [rbx+1]
	mov cl, [var2]
	
	mov rsp, rbp ;leave
	pop rbp
ret
