extern printf			;funcion extern/ajena al programa.
section .data			;Crear variables.
	longitud equ 3
	mensaje db 0xA,0
	mensaje_len equ $-mensaje

section .bss			;Reserva memoria en blanco.
	dividendo resq 1		;vacias. 0x44
	modulo resq 1		;vacias. 0x45
	contador resb 1

section .text				;Codigo.
global main					;Funcion principal.
main:						;Etiqueta de la funcion main.
	push rbp				;Mueve al principio de la pila a rbp.
	mov rbp,rsp				;Movemos el contenido de rpb a rsp.
	mov r8, '0'
		
	mov rcx,0				;Inicializar rcx en 0.
	mov [contador],rcx		;Inicializar contador en 0 (ya que rcx pierde el valor despues del Syscall).
	mov rax,3299			;Dato que se quiere imprimir.
	mov [dividendo],rax		;Se guarda el numero como parametro de dividendo.
inicio_bucle:				;Aqui inicia el bucle.
	mov r9, 10				;Se mueve a r9 el valor del divisor.
	mov rdx,0				;Se inicializa el valor de rdx (donde se colocara el residuo de la divison) en cero, -
							;para evitar conflictos.
	div qword r9			;Se realiza la division (rax / r9). div [valor] ~ cociente => rax, residuo => rdx.
		
	mov [dividendo],rax		;El valor de resdiv = rax.
	add rdx, '0'			;Convierte el simbolo en ASCII
	mov [modulo],rdx		;El valor de modulo = rdx
	;add qword [modulo], '0'	;Convierte el residuo en su simbolo ASCII, sumandole 48 (48 == '0').
	;mov rdx, [modulo]
	cmp rdx, '0'
	cmove rdx, r8
	push rdx
	mov rcx,[contador]		;Se mueve el valor del contador a rcx.
	mov rax,[dividendo]		;El valor del dividendo se mueve a rax para realizar la division -
							;(ya que aqui se va a almacenar el resultado de la division durante el bucle).
	inc rcx					;Se incrementa el vaor del contador.
	mov [contador],rcx		;Se respalda el valor del contador incrementado en la variable "contador".			
	cmp rdx, '0' 				;Si la resta de rcx - longitud = 0, activa la bandera de cero (Z) en el registro de Rflags.
	je final_bucle			;if(contador = longitud) { salta a inicio bucle. }
							;Si no es asi, sigue adelante.
	jmp inicio_bucle		;Salta al inicio del bucle a repetir.
final_bucle:
	mov r9, 0
	pop r10
imprimir_bucle:
	inc r9
	pop r10
	; ----------------   Se imprime el residuo.   -----------------------
	mov rax,1
	mov rdi,1
	mov [rsi], r10
	mov rdx,1
	Syscall
	cmp r9, [contador]
	jne imprimir_bucle
	;-------------------------------------------------------------------

	; ----   Se imprime el salto de linea y terminador de cadena.   ----
	mov rax,1
	mov rdi,1
	mov rsi,mensaje
	mov rdx,mensaje_len
	Syscall
	;-------------------------------------------------------------------
	mov rsp,rbp	;Movemos el contenido de rsp a rbp, restaurandolo.
	pop rbp		;Restauramos el registro.
ret				;Return main. 

;---------------------- Comandos de compilacion. -----------------------
;nasm -f elf64 -g -F dwarf registros.asm -l registros.lst
;gcc -o registros registros.o -no-pie
;Makefile
;0x404028 -> H
;-----------------------------------------------------------------------
