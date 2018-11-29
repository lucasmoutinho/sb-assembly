%include "io.mac"
.DATA

vector dd 0, 1, 2, 3, 4
secvector dd 2, 3, 4, 0, 1

size_vector equ 5
size_secvector equ 5

.CODE
.STARTUP

mov ecx, 0 ; i = 0
loop_i: cmp ecx, size_vector
jge end

mov ebx, [vector + ecx * 4]
mov edx, 0 ; j = 0

loop_j: cmp edx, size_secvector
jge pseudo_end

mov eax, [secvector + edx * 4]
cmp ebx, eax
je pseudo_end
PutInt ax
inc edx
jmp loop_j

pseudo_end: nwln
inc ecx
jmp loop_i

end: 
nwln
.EXIT