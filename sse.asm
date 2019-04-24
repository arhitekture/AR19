;sa ulaza ucitati 64 dvbajtna integera i pomocu SSE instruciskog seta izracunati vrijednost funkcije 
;5*x*x + 2*x + 1, pa vrijdnost redom ispisati na konzolu


section .data
inputformat db '%f', 0
outputformat db '%d ', 0
one dd 1.0
two dd 2.0
five dd 5.0

section .bss
buffer resb 256
petkvadrata resd 1
dvaiksa resd 1
total resd 1

section .text

global main

extern scanf, printf

main:

push rbp
mov rbp, rsp
push rbx
push rdi
push rsi

;ucitavanje
mov r12, 0
mov rsi, buffer
ucitaj:
cmp r12, 256
je ucitano
mov rax, 0
mov rdi, inputformat
mov rsi, buffer
add rsi, r12
call scanf
add r12, 4
jmp ucitaj

ucitano:
mov r12, 0

mov r13, buffer
obrada:
cmp r12, 256
je end
movss xmm0, [r13]
movss xmm1, [r13]
mulss xmm0, xmm1 ;iks na kvdrat
movss xmm1, [five]
mulss xmm0, xmm1 ;pomnozeno sa 5
movss [petkvadrata], xmm0

movss xmm0, [r13]
movss xmm1, [two]
mulss xmm0, xmm1
movss [dvaiksa], xmm0 ;imamo i to

movss xmm1, [petkvadrata]
addss xmm0, xmm1 ;sabrano pet kvadrata i dva iksa

movss xmm1, [one]
addss xmm0, xmm1

mov r15, 0
cvtss2si r15, xmm0
;push qword [total]
mov [total], r15d

mov rax, 0
mov rdi, outputformat
mov rsi, [total]
call printf

add r12, 4
add r13, 4
jmp obrada






end:


pop rsi
pop rdi
pop rbx
mov rsp, rbp
pop rbp
