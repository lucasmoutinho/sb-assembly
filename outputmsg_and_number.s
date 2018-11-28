global _start

section .bss
msg_input resb 10
number resb 1

section .data
blank db "", 0DH, 0AH
size_blank equ $-blank
msg_output db "Escreva uma frase:", 0DH, 0AH
size_msg_output equ $-msg_output



section .text
_start:

; Guarda numero da sorte na pilha

mov eax, 7
push eax
mov eax, 8
push eax

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

; Escreve a mensagem do usuario

mov eax, 4
mov ebx, 1
mov ecx, msg_input
mov edx, 10
int 80h

mov eax, 4
mov ebx, 1
mov ecx, blank
mov edx, size_blank
int 80h

; Retira numero da sorte da pilha

pop eax
pop eax


; Imprime numero

mov ecx, eax
add cl, '0'
mov [number], cl
mov eax, 4
mov ebx, 1
mov ecx, number
mov edx, 1
int 80h

mov eax, 4
mov ebx, 1
mov ecx, blank
mov edx, size_blank
int 80h

; Finaliza o programa

mov eax, 1
mov ebx, 0
int 80h
