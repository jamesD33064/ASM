... MAIN

.COPY    START   1000
.FIRST   JSUB    READ
        JSUB    READ
        JSUB    WRITE
        J	OVER
.       END     FIRST

... READ
READ    LDX     ZERO
RLOOP   TD      INDEV
        JEQ     RLOOP
R       RD      INDEV   .讀一個 byte 到 A暫存

        STL	FUNC    .紀錄READ的位址
        JSUB    CHANGE  .L位址變這行
        LDL	FUNC    .將L的位址改回READ
        STCH    STR , X
        
        TIX	COIN    .加一直到讀到＄
        COMP	COIN
        JEQ     JUMP    .就跳走到RSUB

        J	R

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

... CHANGE TO BIG
CHANGE  COMP	CHA
	JLT	JUMP

	COMP	CHZ
	JGT	JUMP

        SUB     C

... RSUB
JUMP    RSUB

... OUT
OVER    LDX	ZERO


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