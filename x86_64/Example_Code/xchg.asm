; xchg example code
; dash@hack4.org
; shellcode lab
; may 2016

BITS 64
global _start

_start:

xor rax, rax
xor rbx, rbx

mov rax, 0x29A ; http://web.textfiles.com/ezines/29A/
mov rbx, 0x539
mov r10, 0xBEEFBEEFBEEFBEEF
xchg rax, r10
xchg r10, r9
xchg rbx, rax
xchg rdi,rsp
