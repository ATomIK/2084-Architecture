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
		
		mov		bl,al
		
		mov		ah,1
		int		21h		; bl = first - al = second
		
		shl		bl,4	; first letter
		shr		bl,6
		shl		bl,3
		
		shl		al,4	; second letter
		shr		al,5
		
		or		bl,al
		or		bl,40H
		
		mov		dl,bl
		mov		ah,2
		int		21H
		
		jmp		LUP
		
		
	E:	mov		ah,4ch
		int		21h
		END		Main