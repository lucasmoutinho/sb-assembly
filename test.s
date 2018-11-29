%include "io.mac"
.DATA

msg_first db "Digite o primeiro numero: ", 0
msg_second db "Digite o segundo numero: ", 0
msg_mult db "A multiplicacao é: ", 0
msg_mult_first db "O primeiro número é: ", 0
msg_mult_second db "O segundo número é: ", 0
msg_overflow db "Rolou overflow", 0

.CODE
.STARTUP

PutStr msg_first
GetLInt eax
PutStr msg_second
GetLInt ebx

push eax
push eax
push eax
push ebx
call mult
pop ecx
pop edx
cmp edx, 0
jne overflow

PutStr msg_mult
PutLInt ecx
nwln
PutStr msg_mult_first
PutLInt eax
nwln
PutStr msg_mult_second
PutLInt ebx
nwln
end: .EXIT

mult:
push ebp
mov ebp, esp
push edx
push eax
mov edx, 0
mov eax, [ebp + 12]
imul dword [ebp + 8]
mov [ebp + 16], eax
mov [ebp + 20], edx
pop eax
pop edx
pop ebp
ret 8

overflow:
PutStr overflow
nwln
jmp end
