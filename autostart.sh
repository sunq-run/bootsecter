#!/bin/sh
name=$1
isofile=$2
cldir=`pwd`
echo "[[create vm]] as "$name
VBoxManage createvm -name $name --register --basefolder ./
echo "[[add storagectl]]"
VBoxManage storagectl $name --name takeyuki --add ide
echo "[[add drive iso]] file is "$cldir"/"$isofile
VBoxManage storageattach $name --storagectl takeyuki --port 1 --device 1 --type dvddrive --medium $cldir"/"$isofile
echo "[[now... start]]"
VBoxManage startvm $name
