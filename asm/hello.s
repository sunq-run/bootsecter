        /* hello.s */
        .code16
        .intel_syntax noprefix
        .globl _start
_start:
        call set_video_mode
        call set_bg_color
        lea si, msg_hello
        call print
        lea si, msg_waitkey
        call print
        call reboot

set_video_mode:
        mov ah, 0x00      /* VIDEO - SET VIDEO MODE */
        mov al, 0x12      /* 640x480x16 (VGA) */
        int 0x10
        ret

set_bg_color:
        mov ah, 0x0b      /* VIDEO - SET BACKGROUND/BORDER COLOR */
        mov bh, 0x00
        mov bl, 0x01      /* Blue */
        int 0x10
        ret

print:
        mov ah, 0x0e      /* VIDEO - TELETYPE OUTPUT */
        mov bl, 0x0f      /* White */
        mov bh, 0x00
print_loop:
        lodsb
        test al, al
        jz print_end
        int 0x10
        jmp print_loop
print_end:
        ret

reboot:
        mov ah, 0x00       /* KEYBOARD - GET KEYSTROKE */
        int 0x16
        int 0x19           /* SYSTEM - BOOTSTRAP LOADER */

msg_hello:
        .asciz "Hello, World!\r\n"
msg_waitkey:
        .asciz "\r\nPress any key to reboot..."

