INLOOP	TD INDEV
	JEQ INLOOP 
	RD INDEV 
	STCH DATA 
	
OUTLP 	TD OUTDEV 
	JEQ OUTLP 
	LDCH DATA 
	WD OUTDEV 



...   ---------------------
...  //   M E M O R Y   //
... ---------------------



INDEV BYTE X'F1'
OUTDEV BYTE X'F2'
DATA RESB 1