; this function format an 16-bit hexadecimal number in order to be printed
; it uses print and assumes org is used

; parameter are loaded in bx, function is buffer agnostic
print_hex:
	pusha
	; printing 8-bit MSB
	mov ax, [bx]; lea the input parameter 
	mov cx, 0 ; cx is the counter
	call evaluate
	shift:
	    shr ax, 4
	    add cx, 1
	    call evaluate
	    ; check that 16-bit has been evaluated
	    cmp cx, 3
	    jne shift
	popa
	ret

; call to compare the 8 bit number stored in AX
evaluate:
	push ax
	and ax, 0x000f
	cmp al, 0xa	; comparison for [0-10] or [a-f]
	jl print_dec
	cmp ax, 0xa
	jge print_hexa

print_dec:
	add ax, 0x30
	mov ah, 0x0e
	int 0x10
	pop ax
	ret	; return to evaluate

; printing alpha numeric hex character with 0x61 - 0x10
print_hexa:
	add ax, 0x57  
	mov ah, 0x0e
	int 0x10
	pop ax
	ret
