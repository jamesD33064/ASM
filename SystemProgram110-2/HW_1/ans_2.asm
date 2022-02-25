        JSUB    READ
        JSUB    WRITE

READ    LDX     ZERO
RLOOP   TD      INDEV
        JEQ     RLOOP
        RD      INDEV
        JSUB    CHANGE
        STCH    DATA,X

WRITE   LDX	ZERO
WLOOP   WD	OUTDEV
        JEQ     MLOOP
        LDCH	DATA,X

        LDX ZERO
MOVECH  LDCH F1 , X
        
        COMP SZ
        JGT CHANGE
        STCH F2 , X
        COMP COIN
        JEQ NEXT
        TIX 99
        J MOVECH

CHANGE  SUB T
        STCH F2 , X
        TIX 99
        J MOVECH
        
NEXT    LDX ZERO


INDEV   BYTE    X'F1'
OUTDEV  BYTE    X'F2'

DATA    RESB    1

ZERO    WORD    0
T       WORD    32
SZ      WORD    91
COIN    WORD    0x24
