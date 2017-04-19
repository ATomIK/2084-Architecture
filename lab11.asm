; Thomas Johnson
		.MODEL		small
		.STACK		100h
		.DATA
ARR		DB		30 DUP(?),'$'
		.CODE
Main:	mov		ax,@data
		mov		ds,ax

		lea		bx,ARR
		
LUP:	mov		ah,1
		int		21h
		
		cmp		al,0DH
		je		E		; end program if enter
		
		mov		cl,al
		
		mov		ah,1
		int		21h		; cl = first - al = second
		
		shl		cl,4	; first letter
		shr		cl,6
		shl		cl,3
		
		shl		al,4	; second letter
		shr		al,5
		
		or		cl,al
		or		cl,40H
		
		; PRINTING OUT THE RESULTING CHAR
		;mov		dl,bl
		;mov		ah,2
		;int		21H
		
		mov		[bx],cl
		add		bx,1
		
		jmp		LUP
		
E:		lea		dx,ARR
		mov		ah,9
		int		21h
		
ED:		mov		ah,4ch
		int		21h
		END		Main