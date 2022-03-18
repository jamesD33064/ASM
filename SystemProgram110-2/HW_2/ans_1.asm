... MAIN

... WRITE 
WRITE   LDX	#0
WLOOP   TD	OUTDEV
        JEQ	WLOOP

CAC     LDS	#0
SET     LDX	#0      .初始化
        LDA	#1      .S為外層參數
        ADDR	A,S     .將S加A (1)

IN      STA	PUTA    .Ａ為內層參數

        MULR	S,A     .相乘結果到Ａ
        STA	RESULT  .結果放入RESULT

        J	PRINT   .把Ａ的東西印出來 
BACK    
        LDA	PUTA    .將A還原
        ADD	#1     .A加一

        COMP    #10
        JLT	IN
        J	PNL


... PRINT
PRINT   RMO	A,B
        DIV	#10
        COMP	#0
        JGT     TWO	
        J       ONE

ONE     JSUB	PS
        JSUB	PS
        RMO	B, A
        ADD	#48
        WD	OUTDEV
        J       BACK

TWO     JSUB	PS
        ADD	#48
        WD	OUTDEV
        SUB	#48
        MUL     #10
        SUBR    A,B
        RMO	B,A
        ADD	#48
        WD	OUTDEV        	
        J       BACK

...PRINT NEWLINE
PNL     LDA	NL
        WD	OUTDEV
        J	SET

...PRINT SPACE
PS      STA	PUTA_1
        LDA	SPACE
        WD	OUTDEV
        LDA	PUTA_1
        RSUB


...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'

PUTA    RESW    2
PUTA_1  RESW    2
PUTS    RESW    2
RESULT  RESW    2

NINE	WORD	9
TEN     WORD    10
FE      WORD    48

NL      WORD    10
SPACE   WORD    32