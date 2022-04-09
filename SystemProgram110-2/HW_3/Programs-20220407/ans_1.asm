        LDX ZERO
MOVECH  LDCH F1 , X
        
        COMP SZ
        JGT CHANGE
        STCH F2 , X
        COMP COIN
        JEQ NEXT
        TIX NINE
        J MOVECH

CHANGE  SUB T
        STCH F2 , X
        TIX NINE
        J MOVECH
        
NEXT    LDX ZERO

F1 BYTE C'tEsT AsM $abababaB'
F2 RESB 11

ZERO WORD 0
T WORD 32
SZ WORD 91
COIN WORD 0x24
NINE WORD 99
