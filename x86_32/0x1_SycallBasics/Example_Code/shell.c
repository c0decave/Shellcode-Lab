/* 	shell.c
	simple shell for shellcoding-lab at hack4 0x1
	probably ripped somewhere
	~dash
*/

#include <stdio.h>
#include <unistd.h>
#include <string.h>


int main(){

	char *args[2];

	setuid(0);
	args[0] = "/bin/sh";
	args[1] = NULL;
	execve(args[0], args, NULL);
}
