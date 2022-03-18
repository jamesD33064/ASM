WRITE   LDX	ZERO
WLOOP   TD	OUTDEV
        JEQ	WLOOP

	LDCH	NL
        WD	OUTDEV

...   ---------------------
...  //   M E M O R Y   //
... ---------------------

OUTDEV  BYTE    X'F2'
ZERO	WORD	0
NL      WORD    97