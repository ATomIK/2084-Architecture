# notes

## print to the screen (single digits only)

## cout << DL equivalent

MOV     AH,2
ADD     DL,30H
INT     21H

## what about two digits? cout << AL = 25. divide 25 by 10

MOV     AL,25
MOV     BL,10
MOV     AH,0 make the other register 0
DIV     BL AX/BL so 25/10 = 2 in AL and 5 in AH
MOV     DL,AL move 2 to dl
MOV     BL,AH move 5 to bl
ADD     DL,30H
MOV     AH,2
INT     21H
MOV     DL,BL
ADD     DL,30H
MOV     AH,2
MOV     INT 21H

## functions

int incr(int x){
  x = x + 1;
  return x;
}

```
incr    PROC    near    ASSUME BL REGISTER
        ADD     BL,1    increment by 1
        RET             RETURN
incr    ENDP            this function is declared above main
```

int main(){
  int z, y = 2;
  z = incr(y);
  cout << z << endl;
}

header
      .CODE
Main: MOV   AX@DATA
      MOV   DS,AX
	  
footer
MOV     AH,4CH
INT     21H
END     Main

MOV   BL,2
CALL  incr
MOV   DL,BL


===
# 3/22/2017
===

SP is a pointer to the top of the stack.
we have to copy SP's value to BP then we
can manipulate BP to find a value in the stack.

MOV		BP, SP
ADD		BP, 6
MOV		BX, [BP] means BX = *BP;

BP is the pointer to SP. [BP+N] is getting a
value N bytes away from the top of the stack.

PUSH, POP = stack commands


===
# 3/29/2017
===

"AND"

mov		al,124		; 0111 1100

and		al,0CH		; 0000 1100

cmp		al,0		; now we compare these two
je		Hell

===

"OR"

mov		al,5		; 0000 0101

or		al,30H		; make this hex

===

"NOT" - "bit flipping"

mov		bl,125		; want to erase two rightmost bits
					; 0111 1101
mov		al,3		; 0000 0011
not		al			; 1111 1100
and		bl,al		; 0111 1100

===

"SHL" - left shift (each bit mul by 2)

mov		al,3		; 0000 0011
shl		al,2		; 0000 1100

===

"SHR" - right shift

mov		al,36		; 0010 0100
shr		al,2		; 0000 1001

===

#### Example of SHR, AND, O

mov		bl,207		; 11001111
shr		bl,6		; 00000011
and		bl,1		; 00000001
or		bl,30H		; 00110001

===
# 4/19/2017
===

Arrays

VAR 	DB		1, 2, 5, 87

Accessing them:

LEA		BX,VAR

MOV		AL,[BX]
MOV		[BX],AL