global _start

section .text:
_start:
	;syscall
	mov eax, 0x4				;use write syscall.
	mov ebx, 1 					;use stdout as file descriptor.
	mov ecx, message 			;use message as buffer.
	mov edx, message_length 	;and supply the length.
	int 0x80					;int->interrupt, identifier for running a hex file.
	
	mov eax, 0x1				;exit syscall
	mov ebx, 0					;return value = 0 (success)
	int 0x80					;invoke syscall
	
section .data:
	message: db "Hello World!", 0xA
	message_length equ $-message 
