#!/bin/bash
# easy build script for shellcode class

if [ $# -ne 1 ];
then
echo "what is the name of the sourcefile, without .asm please"
exit
fi

name=$1

nasm -f elf32 $name.asm -o $name.o;ld -m elf_i386 -o $name $name.o
md5sum $name
ls -al $name
echo "Done"
