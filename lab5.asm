; ASM LAB

; Thomas Johnson
		.MODEL		small
		.STACK		100h
		.DATA
Msg1	DB			"New England is the winner",13,10,'$'
Msg2	DB			"Atlanta is the winner",13,10,'$'
Msg3	DB			"It is a tie!",13,10,'$'
		.CODE
rdr		PROC	near ; bl is our return

		mov		ah,1
		int		21h
		sub		al,30h
		; hopefully multiplying by 10
		mov		dl,10
		mov		bl,al
		mul		bl
		
		mov		bl,al
		
		; takes in the second num
		mov		ah,1
		int		21h
		sub		al,30h
		; our ones digit
		add		bl,al
		
		RET
rdr		ENDP

Main:	mov		ax,@data
		mov		ds,ax
		
		mov		cl,0
LUP:	cmp		cl,3
		JE		E
		
		CALL	rdr
		
		mov		bh,bl
		
		CALL	rdr
		

		cmp		bh,bl
		jg		N
		jl		A
		je		T
		
	N:	mov		ah,9
		lea		dx,Msg1
		int		21h
		jmp		I
		
	A:	mov		ah,9
		lea		dx,Msg2
		int		21h
		jmp		I
		
	T:	mov		ah,9
		lea		dx,Msg3
		int		21h
		jmp		I
		
	I:	add		cl,1
		jmp		LUP
		
	E:	mov		ah,4ch
		int		21h
		END		Main
