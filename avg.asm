; Thomas Johnson
		.MODEL		small
		.STACK		100h
		.DATA
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

prnt	PROC	near

		push	ax
		push	bx
		push	cx
		push	dx
		
		mov		bp,sp
		mov		ax,[bp+10]

		; now al contains 99
		
		mov		ah,0
		mov		bl,10
		div		bl ; al is tenths 9, ah is remainder 9
		
		mov		dl,al
		mov		bl,ah
		add		dl,30H
		
		mov		ah,2
		int		21H ; apparently prints out the first value
		
		add		bl,30H
		mov		dl,bl
		
		mov		ah,2
		int		21H ; apparently prints out the second value
					; if dl is the default printing register

		mov		[bp+10],ax
		
		pop 	dx
		pop 	cx
		pop 	bx
		pop 	ax
		
		RET
prnt	ENDP


Main:	mov		ax,@data
		mov		ds,ax
		
		mov		dx,0
		mov		cl,0
		
LUP:	cmp		cl,3
		JE		E
		
		CALL	rdr
		
		mov		bh,bl
		
		CALL	rdr
		
		add		bl, bh 	; bl has 198
		
		add		dx, bx 	; add nth value into dx
		
		mov		bx,0
		
		
		add		cl,1
		jmp		LUP
		
	E:	; dx should now have 594
		; move dx into ax and divide by 6
		mov		ax, dx
		mov		dl, 6
		div		dl
		
		; al now has 99
	
		push 	AX
		CALL	prnt
		pop 	AX
		
		mov		ah,4ch
		int		21h
		END		Main
