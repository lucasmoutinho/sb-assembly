global _start:

section .bss
sum resd 1
sum_out resb 10

section .data
marks 
dd 4, 5, 50, 3, 10, 77, 89, 12, 15
dd 4, 5, 50, 3, 10, 77, 89, 12, 15
dd 4, 5, 50, 3, 10, 77, 89, 12, 15

number_marks equ (($-marks)/4)
sum_msg db "O somatório foi igual a: ", 0
size_sum_msg equ $-sum_msg
blank db "", 0DH, 0AH
size_blank equ $-blank


section .text
_start:

mov eax, 0
mov esi, 0
mov ecx, number_marks

add_loop:
add eax, [marks + esi * 4]
inc esi
loop add_loop

mov [sum], eax

mov eax, 4
mov ebx, 1
mov ecx, sum_msg
mov edx, size_sum_msg
int 80h

mov eax, [sum]
mov ecx, 10
mov esi, sum_out
call @itoa

mov eax, 4
mov ebx, 1
mov ecx, sum_out
mov edx, 10
int 80h

mov eax, 4
mov ebx, 1
mov ecx, blank
mov edx, size_blank
int 80h

mov eax, 1
mov ebx, 0
int 80h

; ----------------------- itoa inicio ---------------------------------
@itoa:
; input:
; num -> eax
; len -> ecx
; output:
; string -> esi

mov edx, 0
mov edi, 0
cmp eax, 0
jg .itoa_begin
sub edx, eax
mov eax, edx
mov edx, 0
mov edi, 1


.itoa_begin:
add esi, ecx
dec esi
mov dword [esi], 0
mov ebx, 10

.itoa_convert:
xor edx, edx
div ebx
add DL, '0'
dec esi
mov [esi], DL
test EAX, EAX
jnz .itoa_convert

cmp edi, 0
je .itoa_reallyexit
xor edx, edx
add DL, '-'
dec esi
mov [esi], DL

.itoa_reallyexit:
ret