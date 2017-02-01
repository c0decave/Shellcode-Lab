#include <string.h>
#include <sys/mman.h>

char shellcode[] = "";

int main(int argc, char **argv)
{
  // Allocate some read-write memory
  void *mem = mmap(0, sizeof(shellcode), PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);

  // Copy the shellcode into the new memory
  memcpy(mem, shellcode, sizeof(shellcode));

  // Make the memory read-execute
  mprotect(mem, sizeof(shellcode), PROT_READ|PROT_EXEC);

  // Call the shellcode
  int (*func)();
  func = (int (*)())mem;
  (int)(*func)();

  // Now, if we managed to return here, it would be prudent to clean up the memory:
  munmap(mem, sizeof(shellcode));

  return 0;
}
