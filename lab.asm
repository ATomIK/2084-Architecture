; notes
; print to the screen (single digits only)

; cout << DL equivalent
; MOV     AH,2
; ADD     DL,30H
; INT     21H

; what about two digits? cout << AL = 25. divide 25 by 10
; MOV     AL,25
; MOV     BL,10
; MOV     AH,0 ; make the other register 0
; DIV     BL ; AX/BL so 25/10 = 2 in AL and 5 in AH
; MOV     DL,AL ; move 2 to dl
; MOV     BL,AH ; move 5 to bl
; ADD     DL,30H
; MOV     AH,2
; INT     21H
; MOV     DL,BL
; ADD     DL,30H
; MOV     AH,2
; MOV     INT 21H

; functions
; int incr(int x){
;   x = x + 1;
;   return x;
; }

; incr    PROC    near    ; ASSUME BL REGISTER
;         ADD     BL,1    ; increment by 1
;         RET             ; RETURN
; incr    ENDP            ; this function is declared above main

; int main(){
;   int z, y = 2;
;   z = incr(y);
;   cout << z << endl;
; }

; header
;       .CODE
; Main: MOV   AX@DATA
;       MOV   DS,AX
; footer
; MOV     AH,4CH
; INT     21H
END     Main

; MOV   BL,2
; CALL  incr
; MOV   DL,BL


; LAB

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
		
		; =====================
		; FIRST PROGRAM
		;mov		ah,1
		;mov		21h
		;sub		al,30h
		
		;mov 	bl,al ; copies in first num
		
		;mov		ah,1
		;int		21h
		;sub		al,20h
		
		;mov		cl,al
		
		; =====================
		
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
