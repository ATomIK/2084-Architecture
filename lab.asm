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
