section .data
	input dd 10234500h,10237000h

section .bss
	output resd 1

section .text
global _start
_start:
	xor rax,rax
	xor rbx,rbx
	xor rsi,rsi
	mov rsi,input
	mov eax,[rsi]
	mov ebx,[rsi+4]
	xor ebx,eax

	xor r8,r8
	xor rcx,rcx
	mov cl,32
	
petlja:
	xor eax,eax
	shr ebx,1
	adc eax,0
	cmp eax,1
	je dalje
	cmp ebx,0
	je kraj	
	loop petlja

dalje:
	inc r8
	loop petlja
kraj:
	mov [output],r8

	mov rax,60
	mov rdi,0
	syscall