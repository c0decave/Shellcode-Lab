#include <stdio.h>

unsigned char shellcode[] = "";

int main()
{
printf("Shellcode Length:  %ld\n", sizeof(shellcode) - 1);
int (*ret)() = (int(*)())shellcode;
ret();
}


