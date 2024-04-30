EOI EQU 20H 
IMR EQU 21H 
INT2 EQU 26H 
ID EQU 10 
DATO EQU 40H 
ESTADO EQU 41H 

ORG 1000H 
FLAG DB 0
CHAR DB "_____"
FIN DB ?

ORG 40 
DIR_RUT DW RUT 

ORG 3000H 
RUT: CMP FLAG, 1
JZ INVERSO 
MOV AL, [BX]
OUT DATO, AL 
INC BX 
CMP BX, OFFSET FIN 
JNZ SEGUIR 
MOV FLAG, 1
DEC BX 

ORG 2000H 
CLI 
MOV AL, 11111011B 
OUT IMR, AL 
MOV AL, ID 
OUT INT2, AL 
STI
MOV AH, 0 
MOV BX, OFFSET CHAR 
LAZO: INT 6
INC BX 
INC AH 
CMP AH, 5 
JNZ LAZO 
MOV BX, OFFSET CHAR 
IN AL, ESTADO 
OR AL, 10000000B
OUT ESTADO, AL 
LOOP: CMP FLAG, 2
JNZ LOOP
INT 0 
END 
