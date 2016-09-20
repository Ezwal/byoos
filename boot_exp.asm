; some others experiment, running using x86 instructions using 16bit real mode
; asuming to start as usual at 7c00 
[org 0x7c00]


;mov bx, BIG_STRING
;call print
mov bx, BIG_STRING
call print
mov bx, HEX_VALUE
call print_hex


jmp $					; endless loop 

%include "print_func.asm"
%include "print_hex.asm"

; Data

BIG_STRING:
	db 'I like train    ', 0 

HEX_VALUE:
	dw 0xfa1b

; sector end
times 510 - ($ - $$) db 0
dw 0xaa55				
