#!/usr/bin/env python

import sys
import binascii

text = sys.argv[1]

def usage():
		print "./%s <string2convert>" % (sys.argv[0])
if len(sys.argv)<2:
		usage()
		exit()

val = binascii.hexlify(text[::-1])

print "Stringlen: %d" % len(text)
print "String: %s" % val
print
for i in range(len(val)):
		if i % 8 == 0:
				print "push	 0x",

		print "\b%c" % val[i],
		i=i+1
		k = i % 8
		if k == 0:
				print

				
