section .data
input times 100 db 1 
      times 100 db 2 
brojlen equ $-broj

section .bss
output resb 200

section .text
global _start
_start:

mov rsi,input
mov rdi,output
mov rcx,brojlen
sub rcx,1       ;brojac za prvu petlju

petlja:
mov bh,10
mov al,byte[rsi]
div bh
cmp ah,0
je produzi

mov rdx,rsi 	  ;pamtim gdje sam stao
inc rdx		  ;uvecavam za jedan da uporedjujem sa sledecim
mov rax,rcx
add rax,1	;brojac za drugu petlju
nova:
mov r8,rax
mov bh,10
mov bl,byte[rdx] ;smjestam podatak koji se nalazi na poziciji iznad ovog gore
mov al,byte[rdx]
div bh
cmp ah,0
je dalje
mov bh,byte[rsi] ;smjestam podatak po podatak
cmp bh,bl
ja dalje

mov byte[rsi],bl
mov byte[rdx],bh

dalje:
mov rax,r8
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
