MAIN    LDX     ZERO
        JSUB    WRITE
        J       END


WRITE   TD      OUTDEV
        JEQ     WRITE
WLOOP   LDA     #12
        RMO     A,B
        DIV     #10
        COMP    #0
        JEQ     WS
        J       L2
L1      RMO     B,A
        ADD     #48
        WD      OUTDEV
        J       WSUB
L2      ADD     #48
        WD      OUTDEV
        SUB     #48
        MUL     #10
        SUBR    A,B
        RMO     B,A
        ADD     #48
        WD      OUTDEV
WSUB    RSUB

WS      LDA     #32
        WD      OUTDEV
        J       L1

END     LDX     ZERO
.
STR         RESB    99
OUTDEV      BYTE    X'F2'
.
ZERO        WORD    0
BIGINT      WORD    99
THIRTYTWO   WORD    32
MONEY       WORD    36
TMP         WORD    0
Z           WORD    90