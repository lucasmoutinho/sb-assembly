%include "io.mac"
.DATA

msg_first db "Digite o primeiro numero: ", 0
msg_second db "Digite o segundo numero: ", 0
msg_sum db "A soma é: ", 0
msg_sum_first db "O primeiro número é: ", 0
msg_sum_second db "O segundo número é: ", 0

.CODE
.STARTUP

PutStr msg_first
GetInt ax
PutStr msg_second
GetInt bx


push ax
push ax
push bx
call sum
pop cx

PutStr msg_sum
PutInt cx
nwln
PutStr msg_sum_first
PutInt ax
nwln
PutStr msg_sum_second
PutInt bx
nwln
.EXIT

sum:
push ebp
mov ebp, esp
push cx
mov cx, [ebp + 10]
add cx, [ebp + 8]
mov [ebp + 12], cx
pop cx
pop ebp
ret 4