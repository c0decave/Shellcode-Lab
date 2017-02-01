#!/usr/bin/env python2
#
# crypt des tool for shellcoding lab at hack4
# ~dash

import sys
import crypt

def usage():
    print "%s <password>" % (sys.argv[0])

if len(sys.argv)<2:
    usage()
    exit()

password = sys.argv[1]
pw = crypt.crypt(password,'AB')
print "Password: %s" % pw

