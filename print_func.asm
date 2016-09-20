; external function implementing a print function as intelx86
; calling to this function, register agnostic
; starting functino address is to be stocked on bx 

print: 
	pusha
    	mov ah, 0x0e			; cursor print mode loaded from the screen ISRs

loop: 
	mov cx, [bx]	 		; consider only the offset because org is set in main file
	cmp cl, 0
	je end
	mov al, cl
	int 0x10
	add bx, 1
	jmp loop


end:
    	popa
	ret
