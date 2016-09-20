; this routine use the ISR to read specific part of any HDD 
; known
; load dh sectors to ES:BX from drive DL

disk_load:

    push dx
    mov  ah, 0x02 ; BIOS read function
    mov al, dh	  ; read dh sector
    mov ch, 0x00  ; Cylinder 0
    mov dh, 0x00  ; Head 0
    mov cl, 0x02  ; Sector #2 after boot sector

    int 0x13

    jc disk_error ; if there is an error during the reading 
		  ; then the cf is set and we know it failed

    pop dx	  ; restore dx before it was changed by int
    cmp dh, al	  
    jne disk_error; if number of sector read != asked
    ret

disk_error :

    mov bx, DISK_ERROR_MSG
    call print
    jmp $

; Variables
DISK_ERROR_MSG db "Disk read error .", 0
