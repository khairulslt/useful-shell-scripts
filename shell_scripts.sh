#!/bin/bash

# in directory, find filenames with pattern "*serial_20090101*.csv"
# do row count for each of these files after skipping the header
find /home/khairul/files -name "*serial_$(date +'%Y%m%d%H')*.csv" -exec tail -n +2 {} \; | wc -l | awk '{total += $1} END{print total}')


# in current directory, find all files with filename pattern and remove (recursive)
find . -name "FILENAME" -exec rm -rf {} \:


# checks if certain word is present in a tsv file
# if not present, outputs line to file (separated by tabbed-space)
# useful to generate header in file
if ! grep -q 'time' /home/khairul/count_file-$(date +'%y-%m-%d').tsv; then
	echo time$'\t'count >> /home/khairul/count_file-$(date +'%y-%m-%d').tsv
fi

a=$COMMAND1_HERE
b=$COMMAND2_HERE
TOTAL_COUNT=$((a + b))
DT=$(date +'%Y-%m-%d %H:00:00')

echo $DT$'\t'$TOTAL_COUNT >> home/khairul/count_file-$(date +'%y-%m-%d').tsv