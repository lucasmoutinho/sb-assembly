%include "io.mac"
.DATA

msg_first db "Digite o primeiro numero: ", 0
msg_second db "Digite o segundo numero: ", 0
msg_sum db "A soma é: ", 0

.CODE
.STARTUP

PutStr msg_first
GetInt ax
PutStr msg_second
GetInt bx

call sum

PutStr msg_sum
PutInt cx
nwln
.EXIT

sum:
mov cx, 0
add cx, ax
add cx, bx
ret