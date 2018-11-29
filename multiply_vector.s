%include "io.mac"
.UDATA

result resq 1

.DATA

vector dd 0, 1, 2, 3, 4, 5, 6, 82, 9, 7, 8
vector_size equ ($-vector)/4

.CODE
.STARTUP

mov ecx, vector_size
mov ebx, 0
mov edx, 2

multiply:
mov dword eax, [vector + ebx * 4]
imul dl
mov [vector + ebx * 4], ax
inc ebx
loop multiply

mov ecx, vector_size
mov ebx, 0

print_loop:
mov dword eax, [vector + ebx * 4]
PutInt ax
inc ebx
loop print_loop
nwln
.EXIT