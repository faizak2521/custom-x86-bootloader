org 0x7c00        ; BIOS loads boot sector here
BITS 16


; Entry point for bootloader
start:
	; Prints initial message
	mov si, message
	call print_string 
	
	; New lines 
	mov al, 0x0D 
	int 0x10 
	mov al, 0x0A 
	int 0x10 
	
	mov si, prompt
	call print_string

	; New line before heart
	mov al, 0x0D
    	int 0x10
    	mov al, 0x0A
    	int 0x10

    	; Print ASCII heart
    	mov si, heart1
    	call print_string
    	mov si, heart2
    	call print_string
    	mov si, heart3
    	call print_string
    	mov si, heart4
    	call print_string
    	mov si, heart5
    	call print_string
    	mov si, heart6
    	call print_string
    	mov si, heart7
    	call print_string

.typing_loop:
	mov ah, 0
	int 0x16

	cmp al, 0x0D
	je .newline

	mov ah, 0x0E
	int 0x10
	jmp .typing_loop

.newline: 
	; Print new line (CR + LF)
	mov al, 0x0D 
	int 0x10 
	mov al, 0x0A 
	int 0x10 
	
	jmp .typing_loop

print_string:
	lodsb
	or al, al
	jz .done_string
	mov ah, 0x0E
	int 0x10
	jmp print_string
.done_string:
	ret

delay:
    	push cx
    	mov cx, 0FFFFh
.loop_delay:
	nop
	loop .loop_delay

	
message db "Hi, this is Faiza.", 0
prompt db "My first own VM booted!", 0
heart1 db 0x0D, 0x0A, '    _    _', 0
heart2 db 0x0D, 0x0A, '  /   \/   \', 0
heart3 db 0x0D, 0x0A, '  \        /', 0
heart4 db 0x0D, 0x0A, '   \      /', 0
heart5 db 0x0D, 0x0A, '    \    /', 0
heart6 db 0x0D, 0x0A, '      \/', 0 
heart7 db 0x0D, 0x0A, '_ _ _ _ _ _ _ _', 0



times 510 - ($ - $$) db 0
dw 0xAA55         ; Boot signature

