%include "io.mac"
.DATA

char_prompt db "PLease input a character: ", 0
out_msg1 db "The ASCII code of 0", 0
out_msg2 db " in hex is ", 0
query_msg db "Do you want to quit (Y/N) ", 0
hex_table db "0123456789ABCDEF" ; translation table: 4-bit binary to hex

.CODE
.STARTUP

read_char: PutStr char_prompt ;request a char input
GetCh al ;read input character
PutStr out_msg1
PutCh al
PutStr out_msg2
mov ah, al
mov ebx, hex_table; BX = TRANSLATION TABLE
shr al, 4 ; move up 4 bits to lower half
xlatb ; replace al with hex digit
PutCh al ;write the first hex digit
mov al, ah ;restore input character to al
and al, 0FH ; mask off upper 4 bits
xlatb
PutCh al ; write second hex digit
nwln
PutStr query_msg ; query user wheter to terminate
GetCh al ; read response
cmp al, 'Y' ;if response is not 'Y'
jne read_char ; read another character
done: .EXIT
