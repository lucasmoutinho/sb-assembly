global _start

section .data
snippet db 'KANGOROO', 'CACHORRA', 0DH, 0AH
size_snippet equ $-snippet

section .text
_start:


mov eax, 4
mov ebx, 1
mov ecx, snippet
mov edx, size_snippet
int 80h
mov ebx, snippet
mov eax, size_snippet
sub eax, 2

DoMore: add byte [ebx], 32
inc ebx
dec eax
jnz DoMore

mov eax, 4
mov ebx, 1
mov ecx, snippet
mov edx, size_snippet
int 80h

mov eax, 1
mov ebx, 0
int 80h