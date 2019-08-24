;Loads boot program into RAM
;at boot, processor should read all memory from ROM and make all memory writes to RAM. 
;After we are done loading program to RAM, A special instruction will JMP to address 0 and make the processor read from RAM instead of ROM

	MOV A, 0		;A = pointer to program bytes RAM
	MOV B, mainProgram	;B = pointer to program bytes in ROM

	; get length of program to load
	MOV C, endOfMain	
	MOV D, mainProgram
	SUB C, D		;C = length of program to load
	
	;move program to RAM
	MOV D, [B]
	MOV [A], D
	INC A
	INC B
	CMP C, A
	HLT





mainProgram:	;Program to load goes here
	DB "Hello"
endOfMain:	;leave at end of program
