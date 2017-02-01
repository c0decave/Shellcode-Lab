; shellcode lab 64Bit
; exit example as it should be ;)
; dsah@hack4.org
; 
BITS 64
global _start

_start:

xor		rax,rax
xor		rdx,rdx
mov		al,0x3C
mov		dil,4
syscall
