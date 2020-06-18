#!/bin/bash

# Author: P-C Markovski
# Purpose: Find all binaries in /usr/bin that depend on libselinux and libaudit .so files.

arrBinaries=($(find /usr/bin -type f -executable | xargs -I{} basename {}))


	# Find all binaries in /usr/bin that depend on libselinux.

function getDependencies()
{
	echo "Dependencies on $1: " 
	start=`date +%s`
	for i in "${arrBinaries[@]}"
		do
			ldds=$(ldd /usr/bin/$i)
			if echo $ldds | grep -q $1; then
				echo "Command: $i"
			fi
	done
	end=`date +%s`
}


runtime=$((end-start))
getDependencies "libselinux"
runtime2=$((end-start))
getDependencies "libaudit"

echo "Time, libselinux dependencies: $runtime"
echo "Time, libaudit dependencies: $runtime2"

