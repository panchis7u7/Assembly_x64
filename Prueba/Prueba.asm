section .data

section .bss
	prueba resq 1
section .text
global main
main:
	push rbp
	mov rbp, rsp
	mov rcx, 0xa
	mov [rcx], prueba
	mov [prueba], rcx 
	mov rsp, rbp ;leave
	pop rbp
ret
