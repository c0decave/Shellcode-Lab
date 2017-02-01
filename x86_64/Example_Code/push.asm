; shellcode-lab64 
; dash@hack4.org
; push example and 8byte fun on 64bit architecture
;

BITS 64

global _start
_start:

push byte 0x41
push word 0x4142
push dword 0x41424344
; let's comment that out
; comment it in to see the compile error
;push 0x4142434445464748
