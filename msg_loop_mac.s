%include "io.mac"
.UDATA
input_name resb 10

.DATA

msg_output db "Escreva seu nome: ", 0
msg_name db "O Seu nome é: ", 0
msg_loop db "Vai a merda ", 0
msg_age db "Qual a sua idade? ", 0 

.CODE
.STARTUP

PutStr msg_output
GetStr input_name
PutStr msg_name
PutStr input_name
nwln
PutStr msg_age
GetInt cx

repeat:
PutStr msg_loop
PutStr input_name
nwln
loop repeat

.EXIT

