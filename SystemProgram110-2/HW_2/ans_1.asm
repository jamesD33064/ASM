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

W	LDS	ONE	
INTER	LDA	ONE   

	MULR	S,A
	
	
        WD	OUTDEV

	COMP	NINE
        JEQ	INTER

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

ZERO	WORD	0
ONE	WORD	1
NINE	WORD	9
