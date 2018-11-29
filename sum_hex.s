%include "io.mac"
.UDATA

result resq 1

.DATA

op1 dq 1h
op2 dq 2h
msg_overflow db "Infelizmente teve overflow na soma de dois numeros de 64 bits", 0

.CODE
.STARTUP

mov dword eax, [op1]
mov dword ebx, [op1 + 4]
mov dword ecx, [op2]
mov dword edx, [op2 + 4]

add eax, ecx
jnc after_overflow
PutStr msg_overflow
nwln

after_overflow:
mov dword [result], eax
mov dword [result + 4], ebx

PutLInt [result+4]
PutLInt [result]

nwln
.EXIT

