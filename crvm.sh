#!/bin/sh

VBoxManage createvm -name test2 --register --basefolder ./
VBoxManage storagectl test2 --name cot --add ide
VBoxManage storageattach test2 --storagectl cot --port 1 --device 1 --type dvddrive --medium /home/sunq/test/bootsec/ok.iso



