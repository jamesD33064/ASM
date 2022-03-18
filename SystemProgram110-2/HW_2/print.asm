        JSUB    WRITE
        J	OUT

... WRITE
WRITE   LDX	#0
WLOOP   TD	OUTDEV
        JEQ	WLOOP

	LDA	#10
        DIV	#10
        COMP	#0
        JGT     TWO	
        J       ONE

ONE     ADD	#48
        WD	OUTDEV

        RSUB

TWO     ADD	#48
        WD	OUTDEV


        RSUB


... RSUB
JUMP    RSUB
OUT     LDX	#0

...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'
STR     RESB    100