; Thomas Johnson
		.MODEL		small
		.STACK		100h
		.DATA
		.CODE
Main:	mov		ax,@data
		mov		ds,ax
		
LUP:	mov		ah,1
		int		21h
		
		cmp		al,0DH
		je		E		; end program if enter
		
		shl		al,3
		shr		al,3
						; first letter is AL
		mov		bl,al	; second letter is BL
		
		shr		al,3
		shl		al,2	; split 1
		
		shl		bl,5	; split 2
		shr		bl,4
		
		or		al,41H
		
		or		bl,41H
		
		mov		dl,al
		mov		ah,2
		int		21H
		
		mov		dl,bl
		mov		ah,2
		int		21H
		
		jmp		LUP
		
		
	E:	mov		ah,4ch
		int		21h
		END		Main