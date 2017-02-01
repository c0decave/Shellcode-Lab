; shellcode-lab 64Bit
; dash@hack4.org
; exit code with null bytes
;

BITS 64

global _start

_start:

xor		rax,rax
xor		rdx,rdx
mov		rax,0x3C
mov		rdx,4
syscall
