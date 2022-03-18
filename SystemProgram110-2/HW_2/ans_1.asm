HW2     START   0
MAIN    JSUB	WRITE
        . J       OUT

... WRITE 
WRITE   LDX	#0
WLOOP   TD	OUTDEV
        JEQ	WLOOP

        JSUB    PS
        JSUB    PS
        JSUB    PS
        LDA	#0

UP      ADD	#1
        JSUB    PS
        JSUB    PS
        ADD	#48
        WD	OUTDEV
        SUB     #48
        COMP	#9
        JLT	UP
        LDA	NL
        WD	OUTDEV

CAC     LDS	#0
SET     LDX	#0      .初始化
        LDA	#1      .S為外層參數
        ADDR	A,S     .將S加A (1)
        
        RMO     S,A
        COMP	#10
        JEQ	OUT

        JSUB	PRINT
        LDA	#1      .S為外層參數

IN      STA	ACOUNT  .Ａ為內層參數

        MULR	S,A     .相乘結果到Ａ
        STA	RESULT  .結果放入RESULT

        JSUB	PRINT   .把Ａ的東西印出來 
BACK    
        LDA	ACOUNT  .將A還原

        ADD	#1      .A加一


        COMP    #10
        JLT	IN

        J	PNL


... PRINT
PRINT   RMO	A,B     .把A放到B
        DIV	#10
        COMP	#0
        JGT     TWO	
        J       ONE

ONE     STL	PUTL
        JSUB	PS
        JSUB	PS
        LDL	PUTL
        RMO	B, A
        ADD	#48
        WD	OUTDEV
        RSUB

TWO     STL	PUTL
        JSUB	PS
        LDL	PUTL
        ADD	#48
        WD	OUTDEV
        SUB	#48
        MUL     #10
        SUBR    A,B
        RMO	B,A
        ADD	#48
        WD	OUTDEV        	
        RSUB

...PRINT NEWLINE
PNL     STA	PUTA_1
        LDA	NL
        WD	OUTDEV
        LDA	PUTA_1
        J	SET

...PRINT SPACE
PS      STA	PUTA_1
        LDA	SPACE
        WD	OUTDEV
        LDA	PUTA_1
        RSUB

...OUT
OUT     J       OUT

...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'

ACOUNT  RESW    2
PUTA_1  RESW    2
PUTS    RESW    2
PUTL    RESW    2
RESULT  RESW    2

NINE	WORD	9
TEN     WORD    10
FE      WORD    48

NL      WORD    10
SPACE   WORD    32


        END MAIN