; shellcode-lab64bit
; dash@hack4.org
; byte placements on 64 bit - example
BITS 64
global _start

_start:

; former general purpose register, example
; sub is used to clear out the register
sub rax, rax

mov	rax, 0x4142434445464748
sub rax, rax

mov eax, 0x41424344
sub eax, eax

; address 16bit
mov ax, 0x4142

; overwrite the higher byte of ax
; 0x4142 gets to 0x2d42
mov ah,0x2d
sub ah, ah

mov al,0x41
sub al, al
