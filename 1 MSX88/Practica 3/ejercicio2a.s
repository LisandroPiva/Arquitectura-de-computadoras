PA EQU 30H 
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 1000H
CAR "A"

ORG 2000H
MOV AL, 11111101B
OUT CA, AL 
MOV AL, 0 
OUT CB, AL 
MOV BX, OFFSET CAR 
POLL: IN AL, PA 
AND AL, 1
JNZ POLL
MOV AL, [BX]
OUT PB, AL 
IN AL, PA 
OR AL, 00000010B
OUT PA, AL 
AND AL, 11111101B
OUT PA, AL 
INT 0 
END 
