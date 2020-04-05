#!/bin/bash

# Author: P-C Markovski
# Purpose: Find all binaries in /usr/bin that depend on libselinux and libaudit .so files.


arrBinaries=($(find /usr/bin -type f -executable | xargs -I{} basename {}))
#arrBinaries=($(ls -ltra /usr/bin | awk {'print $NF;'}))

	# Find all binaries in /usr/bin that depend on libselinux.

for i in "${arrBinaries[@]}"
do
	ldds=$(ldd /usr/bin/$i)
	if echo $ldds | grep "libselinux"; then
		echo "Command: $i"
	fi
done

	# Find all binaries in /usr/bin that depend on libaudit.

for i in "${arrBinaries[@]}"
do
        ldds=$(ldd /usr/bin/$i)
        if echo $ldds | grep "libaudit"; then
                echo "Command: $i"
        fi
done

