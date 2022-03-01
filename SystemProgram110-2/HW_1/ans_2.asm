... MAIN
        JSUB    READ
        JSUB    WRITE

... READ
READ    LDX     ZERO
RLOOP   TD      INDEV
        JEQ     RLOOP
R       RD      INDEV   .讀一個 byte 到 A暫存

        JSUB    CHANGE
        STCH    STR , X
        
        TIX	COIN    .加一直到讀到＄
        JEQ	WRITE    .就跳走到write

        J	R
        RSUB

... WRITE
WRITE   LDX	ZERO
WLOOP   TD	OUTDEV
        JEQ	WLOOP
        LDCH	STR , X

W       WD	OUTDEV
        TIX	NINE
        LDCH	STR , X
        COMP	COIN
        JEQ	NEXT
        J	W
        RSUB

... CHANGE TO BIG
CHANGE  COMP	CHA
	JLT	JUMP

	COMP	CHZ
	JGT	JUMP

        SUB     C
JUMP    RSUB

... OUT
NEXT    RSUB

...   ---------------------
...  //   M E M O R Y   //
... ---------------------

INDEV   BYTE    X'F1'
OUTDEV  BYTE    X'F2'


STR     RESB    100

CHA     WORD    97
CHZ     WORD    122

ZERO    WORD    0
C       WORD    32
SZ      WORD    91
COIN    WORD    36
NINE    WORD    99