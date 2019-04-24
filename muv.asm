section .data
	input times 40 db 'a'
              times 20 db '1'
              times 40 db 'B'

section .bss
	output resb 100

section .text
global _start
%macro touppercase 3
	mov rsi,%1
	mov rdi,%2
	mov rcx,%3
%%petlja:
	lodsb
	cmp al,'a'
	jb %%dalje
	cmp al,'z'
	ja %%dalje
	sub al,32
	jmp %%dalje

%%dalje:
	stosb
	loop %%petlja
%endmacro
_start:
	xor rsi,rsi
        xor rdi,rdi
        xor rcx,rcx
	touppercase input,output,100
	
	mov rax,60
	mov rdi,0
	syscall
