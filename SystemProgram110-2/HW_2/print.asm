        JSUB    WRITE
        J	OUT

... WRITE
WRITE   LDX	#0
WLOOP   TD	OUTDEV
        JEQ	WLOOP

	LDA	#8
        RMO	A,B
        DIV	#10
        COMP	#0
        JGT     TWO	
        J       ONE

ONE     LDA	SPACE
        WD	OUTDEV
        RMO	B, A
        ADD	#48
        WD	OUTDEV
        RSUB

TWO     ADD	#48
        WD	OUTDEV
        SUB	#48
        MUL     #10
        SUBR    A,B
        RMO	B,A
        ADD	#48
        WD	OUTDEV        	
        RSUB


... RSUB
JUMP    RSUB
... OUT
OUT     LDX	#0

...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'
SPACE   WORD    32