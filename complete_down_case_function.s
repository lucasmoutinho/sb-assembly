global _start

section .data
snippet db '3 KANGOROO comendo UmA ', 'CACHORRA', 0DH, 0AH
size_snippet equ $-snippet

section .text
_start:

mov eax, 4
mov ebx, 1
mov ecx, snippet
mov edx, size_snippet
int 80h

push eax
push ebx
push ecx
push edx

mov ebx, snippet
mov eax, size_snippet
sub eax, 2
call @down_case 

pop eax
pop ebx
pop ecx
pop edx

mov eax, 4
mov ebx, 1
mov ecx, snippet
mov edx, size_snippet
int 80h

mov eax, 1
mov ebx, 0
int 80h


@down_case:

DoMore: 
cmp byte [ebx], 'A'
jl after
cmp byte [ebx], 'Z'
jg after
add byte [ebx], 32
after:
inc ebx
dec eax
jnz DoMore
ret