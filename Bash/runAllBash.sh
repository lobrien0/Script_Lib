#!/bin/bash

# Author Data:
#
#	Author:		Luke O'Brien
#	Updated:	9/25/2022
#
#	Description:
#		Script scans through current directory and runs
#		.sh files (or bash scripts)


for dir in $(pwd)/*.sh; do
	if [ "${dir}" != "$(pwd)/runAll.sh" ]; then
		bash "${dir}"
	fi
done
