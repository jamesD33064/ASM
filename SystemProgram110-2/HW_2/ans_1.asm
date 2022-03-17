... MAIN

.COPY    START   1000
.FIRST   JSUB    READ
        JSUB    WRITE
        J	OVER
.       END     FIRST

... WRITE
WRITE   LDX	ZERO
WLOOP   TD	OUTDEV
        JEQ	WLOOP

	LDS	ZERO
W       LDA     ONE	
	ADDR    A,S
	LDA	ZERO   

INTER   ADD	ONE
        STA	PUTA
	MULR	S,A
        STA	RESULT
	
        WD	OUTDEV
	LDA	PUTA

	COMP	NINE
        JLT	INTER
        JEQ	W




        J	W

... RSUB
JUMP    RSUB

... OUT
OVER    LDX	ZERO


...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'

STR	RESW	3
PUTA    RESW    2
RESULT  RESW    2


ZERO	WORD	0
ONE	WORD	1
NINE	WORD	9
