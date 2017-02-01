; shellcode-lab64 
; dash@hack4.org
; push example and 8byte fun on 64bit architecture
; use mov to bring up your 8byte value on the stack
; 

BITS 64

global _start
_start:

xor rax, rax ; clear register
mov rax, 0x4142434445464748 ; place 8byte in register rax
push rax                    ; push it onto the stack
