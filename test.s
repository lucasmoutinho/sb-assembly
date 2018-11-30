%include "io.mac"
.UDATA

result resq 1

.DATA

op1 dq 2222h
op2 dq 1111h
msg_overflow db "Infelizmente teve overflow na soma de dois numeros de 64 bits", 0

.CODE
.STARTUP

mov dword eax, [op1]
mov dword ebx, [op1 + 4]
mov dword ecx, [op2]
mov dword edx, [op2 + 4]

add eax, ecx
adc ebx, edx
mov [result], eax
mov [result + 4], ebx
PutLInt [result+4]
PutLInt [result]
nwln

.EXIT

