		.MODEL		small
		.STACK		100h
		.DATA
		
		.CODE
Main:	mov		ax,@data
		mov		ds,ax

		mov		cl, 01 ; 106H contains N = 01
		mov 	dl, 01 ; 107H contains N = 01
		mov		dh, 01 ; 108H contains N = 01
		
		; fetch from these "memory address"
		; everything after this line will be converted to
		; hexadecimal for our machine code program
		
		mov		bh, cl ; move 106H into BH
		mov		bl, cl ; move 106H into BL
		
		mov		bx, 257 ; add 257 to BX
		
		; end program
		
		mov		ah,4ch
		int		21h
		END		Main

; machine code equivalent

; first, we need to fetch from 106H and place it in BX


;		16     reg		address
; 1000 1011 00 011 110 106H???