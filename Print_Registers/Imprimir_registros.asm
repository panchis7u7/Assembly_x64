section .data
	message: db "Hello World!", 0xA,0
	message_length equ $-message-1 
	
section .bss
	;integer resq 1
	digitSpace resb 100
	digitSpacePos resq 1

section .text
global main
main:
	push rbp
	mov rbp, rsp
	mov rax, 12345
	call _print
	
	MOV RAX, 60			;Sys_exit syscall
	MOV RDI, 0			;Salir sin errores
	Syscall
	mov rsp, rbp ;leave
	pop rbp

_print:
	lea rcx, [digitSpace]
	mov rbx, 0xa
	mov [rcx], rbx
	inc rcx
	mov[digitSpacePos], rcx
	
_printLoop:
	mov rdx, 0
	mov rbx, 0xa
	div rbx
	push rax
	add rdx, 48		;ASCII character std
	mov rcx, [digitSpacePos]
	mov [rcx], dl
	inc rcx
	mov [digitSpacePos], rcx
	pop rax
	cmp rax, 0
	jne _printLoop
	
_printLoop2:
	mov rcx, [digitSpacePos]
	mov rax, 1
	mov rdi, 1
	mov rsi, rcx
	mov rdx, 1
	Syscall
	
	mov rcx, [digitSpacePos]
	dec rcx
	mov [digitSpacePos], rcx
	
	cmp rcx, digitSpace
	jge _printLoop2
ret
