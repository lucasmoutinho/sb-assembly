%define code 0
%define limit 4
%define registered 8
%define room 12
global _start:

section .bss
struct resb 16 
response resb 2
number resb 1

section .data
msg1 db "Entre com o codigo do curso ", 0
size_msg1 equ $-msg1
msg2 db "Entre com o limite de alunos ", 0
size_msg2 equ $-msg2
msg3 db "Entre com o numero de alunos matriculados ", 0
size_msg3 equ $-msg3
msg4 db "Entre com o numero da sala ", 0
size_msg4 equ $-msg4
blank db "", 0DH, 0AH
size_blank equ $-blank

section .text
_start:

mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, size_msg1
int 80h

call @get_response
mov dword [eax+code], ebx ;codigo do curso

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, size_msg2
int 80h

call @get_response
mov dword [eax+limit], ebx ;limite de alunos

mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, size_msg3
int 80h

call @get_response
mov dword [eax+registered], ebx ;numero de alunos matriculados

mov eax, 4
mov ebx, 1
mov ecx, msg4
mov edx, size_msg4
int 80h

call @get_response
mov dword [eax+room], ebx ;numero da sala

mov eax, struct
mov edx, 0
mov edx, [eax+code]
add dl, '0'
mov [number], dl
call @print_struct

mov eax, struct
mov edx, 0
mov edx, [eax+limit]
add dl, '0'
mov [number], dl
call @print_struct

mov eax, struct
mov edx, 0
mov edx, [eax+registered]
add dl, '0'
mov [number], dl
call @print_struct

mov eax, struct
mov edx, 0
mov edx, [eax+room]
add dl, '0'
mov [number], dl
call @print_struct

mov eax, 1
mov ebx, 0
int 80h

@get_response:

mov eax, 3
mov ebx, 0
mov ecx, response
mov edx, 2
int 80h

mov ebx, 0
mov bl, [response]
sub bl, '0'
mov eax, struct
ret

@print_struct:

mov eax, 4
mov ebx, 0
mov ecx, number
mov edx, 1
int 80h

mov eax, 4
mov ebx, 0
mov ecx, blank
mov edx, size_blank
int 80h
ret

