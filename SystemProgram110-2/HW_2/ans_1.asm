... MAIN

.COPY    START   1000
.FIRST   JSUB    READ
        JSUB    WRITE
        J	OVER
.       END     FIRST

... WRITE
WRITE   LDX	ZERO
WLOOP   TD	OUTDEV
        JEQ	WLOOP

CA      LDS	ZERO
SET     LDX	ZERO    .初始化
        LDA	ONE     .S為外層參數
        ADDR	A,S     .將S加A (1)

IN      STA	PUTA    .Ａ為內層參數

        MULR	S,A       .相乘結果到Ａ
        . STA	RESULT  .結果放入RESULT



        LDA	PUTA    .將A還原
        ADD	ONE     .A加一

        COMP    TEN
        JLT	IN
        J	SET


... PRINT
PRINT   WD	OUTDEV



... RSUB
JUMP    RSUB

... OUT
OVER    LDX	ZERO


...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'

PUTA    RESW    2
PUTS    RESW    2
RESULT  RESW    2


ZERO	WORD	0
ONE	WORD	1
NINE	WORD	9
TEN     WORD    10
FE      WORD    48

NL      WORD    10    
SPACE   WORD    32