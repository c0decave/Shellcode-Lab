; 8 bit registers 'undocumented', test
; dash@hack4.org
; May 2016 
;
; wikipedia, shellcode trainings no access to certain cpu registers in 8 bit mode
; however, they are addressable
; just adding right now a l to 16bit registers
;

BITS 64

global _start
_start:

mov spl, 1
mov bpl, 2
mov sil, 3
mov dil, 4
