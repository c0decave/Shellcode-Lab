#!/usr/bin/env python
#
# ascii converter for shellcoding-lab at hack4
# ~dash in 2014
#

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
