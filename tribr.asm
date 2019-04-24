section .data
	input dw 125,1024,71

section .bss
	output resd 1

section .text
global _start

%macro thebiggest 3
	xor rdi,rdi
	mov word [output+2],0
	mov rdi,output
	xor rax,rax
	xor rbx,rbx
	xor rcx,rcx

	mov ax,%1
	mov bx,%2
	mov cx,%3

%%prvidrugi:
	cmp ax,bx
	ja %%prvitreci
	jmp %%drugitreci

%%prvitreci:
	cmp ax,cx
	ja %%kraj1
	jmp %%drugitreci

%%drugitreci:
	cmp bx,cx
	ja %%kraj2
	jmp %%kraj3
	
%%kraj1:
	mov [rdi],ax
	jmp %%kraj

%%kraj2:
	mov [rdi],bx
	jmp %%kraj

%%kraj3:
	mov [rdi],cx
	jmp %%kraj

%%kraj:
	xor rdx,rdx
	mov dx,[rdi]
	mov [output],dx
%endmacro

_start:
	mov rsi,input
	thebiggest [rsi],[rsi+2],[rsi+4]
	xor rdx,rdx
	mov dx,[output]

	mov rax,60
	mov rdi,0
	syscall