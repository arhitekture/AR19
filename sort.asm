section .text
broj times 100 db 1
     times 100 db 2
brojlen equ $-broj

section .bss
rez resb 7

section .text
global _start
_start:

mov rsi,broj
mov rdi,rez
mov rcx,brojlen
sub rcx,1       ;brojac za prvu petlju

petlja:
mov bh,0
mov rax,rcx
add rax,1	;brojac za drugu petlju

mov rdx,rsi 	  ;pamtim gdje sam stao
inc rdx		  ;uvecavam za jedan da uporedjujem sa sledecim

nova:
mov bh,byte [rsi] ;smjestam podatak po podatak
mov bl,byte [rdx] ;smjestam podatak koji se nalazi na poziciji iznad ovog gore
cmp bh,bl
ja dalje

mov byte[rsi],bl
mov byte[rdx],bh

dalje:
sub al,1
cmp al,1
je produzi

inc rdx
cmp al,0
je produzi
cmp al,1
jne nova

produzi:
mov bl,byte[rsi]
mov [rdi],bl
inc rdi
inc rsi
loop petlja

mov al,byte[rsi]
mov [rdi],al

mov rax,60
mov rdi,0
syscall
