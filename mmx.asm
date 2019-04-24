section .data
format db '%hu', 0
ispis db '%hu %hu %hu %hu ', 0
dva times 4 dw 2
pet times 4 dw 5

section .bss
temp resb 256
tempprint resq 1


section .text

global main

extern printf, scanf

main:

push rbp
mov rbp, rsp
push rbx
push rdi
push rsi


mov rcx, 0

ucitavanje:
cmp rcx, 256
je done
mov rax, 0
mov rdi, format
mov rsi, temp
add rsi, rcx
push rcx
call scanf
pop rcx
add rcx, 2
jmp ucitavanje

mov rcx, 0
mov rdx ,0
mov r13, 0

done:
mov r12, 0
ucitano:
cmp r12, 256
je kraj
movq mm0,[temp + r12]
movq mm1,[temp + r12]
pmullw mm0, mm1
movq mm1, [dva]
pmullw mm0, mm1
movq mm1, [pet]
paddw mm0, mm1
movq [tempprint], mm0

mov rax, 0
mov rdi, ispis
mov rsi, 0
mov rsi, [tempprint]
mov rdx, 0
mov rdx,  [tempprint + 2]
mov rcx, 0
mov rcx,  [tempprint + 4]
mov r8, 0
mov r8,  [tempprint + 6]
call printf

add r12, 8 
jmp ucitano

kraj:

pop rsi
pop rdi
pop rbx
mov rsp, rbp
pop rbp
