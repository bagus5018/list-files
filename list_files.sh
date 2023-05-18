#! /bin/bash

#Variables
FileLoc=$1
TimeStamp=$(date +%m_%d_%Y_%H_%M_%S)
LogDir=/DTA/Output
FileLog="${TimeStamp}".log
array=( $( ls ${FileLoc} ) )

# check if log directory exists, if not creates it
[ ! -d "$LogDir" ] && mkdir -p $LogDir

#create timestamped log file
echo "File Listing" >> "${LogDir}"/"${FileLog}"

echo "importing files from ${FileLoc}"
echo ${array[@]}

for elem in ${array[@]}; do
	if [ $elem == .xz ]
	then tar -ztvf $FileLoc/$elem >> "${LogDir}"/"${FileLog}" 

	else tar -tvf $FileLoc/$elem  >> "${LogDir}"/"${FileLog}"
	fi
done;
