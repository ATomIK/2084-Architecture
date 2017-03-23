```asm
; Thomas Johnson
		.MODEL		small
		.STACK		100h
		.DATA
		.CODE
rdr		PROC	near ; bl is our return

		mov		ah,1
		int		21h
		sub		al,30h ; our tenths digit
		; hopefully multiplying by 10
		mov		ch,10
		mul		ch

		mov		bl,al

		; takes in the second num
		mov		ah,1
		int		21h
		sub		al,30h ; our ones digit
		; add them together now bl has a double digit val
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

		CALL	rdr ; 99

		mov		bh,bl

		CALL	rdr ; 99

		add		bl, bh 	; bl now has 198
		; bh still has a val
		mov		bh, 0
		; now bh = 0, bl = 198
		add		dx, bx 	; add nth value into dx

		; erase bx for the next loop
		mov		bx,0

		; cl++
		add		cl,1
		jmp		LUP

		; end of loop.
		; dx should now have 594.
		; move dx into ax and divide by 6.
	E:	mov		ax, dx
		mov		dl, 6
		div		dl

		; al now has an average of 99

		push 	AX
		CALL	prnt
		pop 	AX

		mov		ah,4ch
		int		21h
		END		Main

```
