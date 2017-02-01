; shellcode-lab64bit
; dash@hack4.org
; byte placements on 64 bit - example for new register r10
BITS 64
global _start

_start:

; former general purpose register
sub r10, r10

mov	r10, 0x4142434445464748
sub r10, r10

mov r10d, 0x41424344
sub r10d, r10d

mov r10w, 0x4142
sub r10w, r10w

mov r10b,0x42
sub r10b, r10b
