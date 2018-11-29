%include "io.mac"
.UDATA

response resb 2

.DATA

msg db "Entre um numero binario de dois digitos: ", 0

.CODE
.STARTUP

PutStr msg
GetStr response

cmp byte [response], '0'
jnz first_one 

cmp byte [response+1], '0'
jnz second_one
PutInt 0
jmp end

second_one:

PutInt 1
jmp end

first_one:

cmp byte [response+1], '0'
jnz third_one
PutInt 2
jmp end

third_one:

PutInt 3

end: nwln
.EXIT