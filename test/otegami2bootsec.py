#!/usr/bin/python
usage = "python otegami2bootsec.py example.s example.iso"
import sys
import os
import subprocess
argvs = sys.argv
bscode = argvs[1]
if argvs[1] == "-h":
	print usage
	exit()
ret = subprocess.check_output(["gcc","-nostdlib","-Ttext=0x100","-Wl,--oformat=binary","-o","tmp.bin",bscode])
print ret
f = open("hinagata.iso","rb")
hinagata = f.read()
f.close()
sbin = open("tmp.bin","rb")
sectercode = sbin.read()
sbin.close()
zerobytes = 2048 - len(sectercode) - 2
zerocode = "\00" * zerobytes
sign = "\x55\xaa"
isofile = hinagata + sectercode + zerocode + sign
make = open(argvs[2],"wb")
make.write(isofile)
make.close()

