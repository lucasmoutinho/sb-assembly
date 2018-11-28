global _start

section .bss
msg_input resb 10
number resb 1

section .data
blank db "", 0DH, 0AH
size_blank equ $-blank
msg_output db "Escreva uma frase:", 0DH, 0AH
size_msg_output equ $-msg_output
times_msg db "Quantas vezes vc quer que sua mensagem apareça?", 0DH, 0AH
size_times_msg equ $-times_msg

section .text
_start:


; Imprime mensagem de introdução

mov eax, 4
mov ebx, 1
mov ecx, msg_output
mov edx, size_msg_output
int 80h

; Le a mensagem do usuario

mov eax, 3
mov ebx, 0
mov ecx, msg_input
mov edx, 10
int 80h

; Imprime mensagem de times

mov eax, 4
mov ebx, 1
mov ecx, times_msg
mov edx, size_times_msg
int 80h

; Recolhe number
mov eax, 3
mov ebx, 0
mov ecx, number
mov edx, 1
int 80h

; Prepara o loop

mov eax, 0
mov al, [number]
sub al, '0'
mov ecx, 0

; Faz o loop como se fosse um do while

display:
push eax
push ecx

; Escreve a mensagem do usuario

mov eax, 4
mov ebx, 1
mov ecx, msg_input
mov edx, 10
int 80h

pop ecx
pop eax
inc ecx
cmp ecx, eax
jl display 


; Finaliza o programa
end:
mov eax, 4
mov ebx, 1
mov ecx, blank
mov edx, size_blank
int 80h

mov eax, 1
mov ebx, 0
int 80h
