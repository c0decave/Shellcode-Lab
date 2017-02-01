; shellcode-lab64 
; dash@hack4.org
;

; some example to zero-out a register
BITS 64
global _start
_start:

xor rax, rax	; initial clearing - classic xor
mov rax, 0xDEADBEEF
sub rax, rax    ; sub opcode

mov rax, 0xF00DBABE
xor rax, rax	; classic xor

; check value of register and add or sub from that
; let's assume 29A is in the register rcx
sub rcx, rcx
mov rcx, 0x29A
sub rcx, 666 
; zero'd
