... MAIN
        JSUB    READ
        JSUB    WRITE

... READ
READ    LDX     ZERO
RLOOP   TD      INDEV
        JEQ     RLOOP
        RD      INDEV   .讀一個 byte 到 A暫存
.        JSUB    CHANGE
        STCH    STR,X
        
        TIX	COIN    .加一直到讀到＄
        JEQ	NEXT    .就跳走結束

        J	RLOOP
        RSUB

... WRITE
WRITE   LDX	ZERO
WLOOP   WD	OUTDEV
        JEQ	WLOOP
        LDCH	STR,X
        WD	OUTDEV
        TIX	


... CHANGE TO BIG
CHANGE  SUB     C
        STCH    F2 , X
        TIX     99
        J       MOVECH
        RSUB

... OUT
NEXT    LDX ZERO




...   ---------------------
...  //   M E M O R Y   //
... ---------------------

INDEV   BYTE    X'F1'
OUTDEV  BYTE    X'F2'


STR     RESB    100

K100    WORD    100
ZERO    WORD    0
C       WORD    32
SZ      WORD    91
COIN    WORD    0x24
