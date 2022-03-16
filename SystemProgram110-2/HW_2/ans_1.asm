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

W       LDCH	STR , X
        WD	OUTDEV
        TIX	NINE
        COMP	COIN
        JEQ	JUMP
        J	W


...   ---------------------
...  //   M E M O R Y   //
... ---------------------

INDEV   BYTE    X'F1'
OUTDEV  BYTE    X'F2'


STR     RESB    100
FUNC    RESW    1

CHA     WORD    97
CHZ     WORD    122

ZERO    WORD    0
C       WORD    32
COIN    WORD    36
NINE    WORD    99