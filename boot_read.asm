[org 0x7c00]

mov [BOOT_DRIVE], dl

mov bp, 0x8000
mov sp, bp

mov bx, 0x9000
mov dh, 5
mov dl, [BOOT_DRIVE]
call disk_load

mov bx, [0x9000]
call print_hex

mov bx, [0x9000 + 512]
call print_hex

jmp $

%include "disk_load.asm"
%include "print_hex.asm"
%include "print_func.asm"

BOOT_DRIVE: db 0

times 510 - ($ - $$) db 0
dw 0xaa55

; padding to check if the read works as intended
times 256 dw 0xdada
times 256 dw 0xface 
