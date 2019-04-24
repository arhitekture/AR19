;Napisati asemblerski program za izracunavanje najmanjeg trocifrenog clana Fibonacijevog niza (f0=0, f1=1, f2=1, f3=2, ...). 
;Rezultat upisati u memorijsku lokaciju REZ.

section .bss
REZ RESB 1

section .text
global _start

start:

MOV BL,1
MOV AL,1

ponovo:
MOV CL,BL
ADD AL,BL
CMP AL,100

ja dalje
MOV BL,AL
MOV AL,CL
jna ponovo

dalje:
mov byte [REZ],al

mov rdi,60
mov rcx,1
syscall