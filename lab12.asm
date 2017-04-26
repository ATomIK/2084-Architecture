; Thomas Johnson
		.MODEL		small
		.STACK		100h
		.DATA
ARR		DB		30 DUP(?)
		.CODE
Main:	mov		ax,@data
		mov		ds,ax
		
		mov		dx,0
		
LUP:	mov		ah,1
		int		21h
		
		cmp		al,0DH
		je		DCOD	; end program if enter
		sub		al,30H
		
		mov		bl,al
		
		mov		ax,dx	; ax has our val dx
		mov		bh,10
		mul		bh
		mov		dx,ax	; dx is now our val again
		
		mov		bh,0
		add		dx,bx
		
		jmp		LUP

		
		
DCOD:	; decoding here
		
		;lea		bx,ARR
		
		;mov		[bx],cl
		;add		bx,1
		
		;lea		dx,ARR

		
			
		mov		ah,9
		int		21h
		
		;'$'
		
ED:		mov		ah,4ch
		int		21h
		END		Main