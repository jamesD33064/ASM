... MAIN

.COPY    START   1000
        JSUB    WRITE
        J	OVER
.       END     FIRST

... WRITE
WRITE   LDX	ZERO
WLOOP   TD	OUTDEV
        JEQ	WLOOP
	LDA	#12
	STA	STR

W       LDCH	STR
        WD	OUTDEV
        TIX	NINE
        COMP	COIN
        JEQ	JUMP
        RSUB
... RSUB
JUMP    RSUB

... OUT
OVER    LDX	ZERO


...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'

STR     RESB    100
FUNC    RESW    1

CHA     WORD    97
CHZ     WORD    122

ZERO    WORD    0
C       WORD    32
COIN    WORD    36
NINE    WORD    99