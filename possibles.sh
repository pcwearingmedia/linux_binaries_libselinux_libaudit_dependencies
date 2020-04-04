#!/bin/bash

# Author: P-C Markovski
# Purpose: Find all binaries in /usr/bin that depend on libselinux and libaudit .so files.


arrBinaries=($(ls -ltra /usr/bin | awk {'print $NF;'}))

for i in "${arrBinaries[@]}"
do
	echo $i
	ldd "/usr/bin/$i"
done
