#include <stdio.h>
#include <string.h>
#include <unistd.h>

char shellcode[] = "";

int main(void)
{
 int *ret;

    printf("%d\n",strlen(shellcode));
    ret = (int *)&ret+2;
    *ret = (int)shellcode;
return 0;
}
