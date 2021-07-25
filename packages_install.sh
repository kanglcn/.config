#!/bin/bash

#packages=""

for line in `cat ./my_packages.txt`
do
#	packages="$packages $line"
	sudo pacman -S $line
done

#sudo pacman -S  $packages
