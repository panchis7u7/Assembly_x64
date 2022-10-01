section .data
    ok_msg db "OKAY",0xA,0
    ok_msg_len equ $-ok_msg-1
    MAP_FAILED equ -1
    PROT_READ equ 0x1
    PROT_WRITE equ 0x2
    PROT_EXEC equ 0x4
    PROT_NONE equ 0x0
    MAP_PRIVATE equ 0x2
    MAP_ANONYMOUS equ 0x20

section .text
global main
main:
    push rbp
    mov rbp,rsp	

    mov rsi, ok_msg
    call print

    mov rsp,rbp
    pop rbp
    ret

print:
    push rbp
    mov rbp,rsp	

    ; Point to the same address as the parameter from rsi.
    lea rbx, [rsi]  

    ; Call mmap to retrieve somo memory space (simulate vga screen space)
    mov rax, 9								;mmap syscall no.
	mov rdi, 0								;hint 
	mov rsi, 4096							;page size
	mov rdx, PROT_READ | PROT_WRITE			;Read and write memory
	mov r10, MAP_PRIVATE | MAP_ANONYMOUS	;no shared pages
	mov r8, 0 								;no file descriptor
	mov r9, 0								;no offset
	syscall

    cmp rax, MAP_FAILED
    jle error

    xor rcx, rcx        ; Clear RCX.
    xor rdx, rdx        ; Clear RDX.

print_loop:
    mov rdx, [rbx+rcx]              ; Assign at the nth address of the index, the value of the nth character.
    mov [rax+(rcx*2)], byte 0x2F    ; Black background with white text.
    mov [rax+(rcx*2)+1], dl         ; Copy the first character to the n + 1 address.
    inc rcx
    cmp rdx, 0
    je success
    jmp print_loop
    ; movzx rax, byte [rbx]

error:
success:
    mov rsp,rbp
    pop rbp
    ret

    
; Input (esi -> data), (edx -> length) 
