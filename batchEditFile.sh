#!/bin/sh

for file in *.php;
do
	newfile=`echo $file | sed 's/\.class//'`
	mv $file $newfile
done
