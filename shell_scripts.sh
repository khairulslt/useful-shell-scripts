#!/bin/bash

# in directory, find filenames with pattern "*serial_20090101*.csv"
# do row count for each of these files after skipping the header
find /home/khairul/files -name "*serial_$(date +'%Y%m%d%H')*.csv" -exec tail -n +2 {} \; | wc -l | awk '{total += $1} END{print total}')


# in current directory, find all files with filename pattern and remove (recursive)
find . -name "FILENAME" -exec rm -rf {} \:


# in directory, find filenames with pattern "*medical*.csv"
# "xargs" groups them together and appends data in files (without header)
# to a new file with the (linux) date suffix
# echo command helps create a log file
#
# e.g if below is a shell script called
# "date_aggregation.sh"
# you call it like this in a cron job
# 
# 15 * * * *	/home/khairulslt/bin/date_aggregation.sh $(date +'\%Y\%m\%d\%H' -d "+ 5 hour")

DT="$1";
SUFFIX="0000";
FILE1="All-Medicals-$DATE.csv";
find /home/khairul/files -name "*medical*.csv" -print0 | xargs -0 tail -n + 2 >>  "$FILE1"

echo "$(date +'%Y-%m-%d %H:%M:%S.%3N' -d "+ 7hour") [INFO] '$FILE1' has been created" >> /home/khairulslt/log/medicals.log



# sed command helps to remove blank spaces
# and lines that start with '='
sed -i '/^$/d' "$FILE1"
sed -i '/^=/d' "$FILE1"



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