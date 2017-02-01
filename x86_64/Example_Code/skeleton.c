/* shellcode-lab 64Bit 
   dash@hack4.org
   
   use -z execstack
   or set char code to const
*/

#include <stdio.h>
#include <string.h>

unsigned char code[] ="shellcode wants to be placed here!";
main()
{
   printf("Shellcode Len: %d\n", (int)strlen(code));
   int (*ret)() = (int(*)())code;
   ret();
}
