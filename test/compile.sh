#!/bin/sh

gcc -nostdlib -Ttext=0x100 -Wl,--oformat=binary -o takeyuki.bin grap.s
