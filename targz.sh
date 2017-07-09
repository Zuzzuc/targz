#!/bin/bash
# License: The MIT License (MIT)
# Author Zuzzuc https://github.com/Zuzzuc

# This script is used to archive and unarchive tar.gz files.
# NOTE: When unarchiving, set output to the dir to put the files in.

if [ "$(caller 0)" != "" ];then
	exit_mode="return"
else
	exit_mode="exit"
fi

catch_err(){
	# Input is $1 and optionally $2, where $1 is the error code description to display and $2 can be specified to override the default error message.
	if [ -z $2 ];then
		case "$1" in
    		1)
   				echo "No input file specified."
   				;;
   			2)
   				echo "The input file '$3' does not exist."	
   				;;
   			3)
   				echo "Unknown argument. Failing argument is '$3'"
   				;;
   			4)
   				echo "Unknown mode. Supplied mode is '$3'"
   				;;
   			5)
   				echo "Incorrect compression level. It must be between 1 and 9. Specified one was '$3'"
   				;;
   		esac
   	else
   		echo "$2"
   	fi
   	error_code=$1
}

# Default vars
compression_level="6" # This is the default compression level with common tools, such as gzip, zip and zcat.

# Handle input
if [ "$*" != "" ];then	
	for i in "$@";do
		case "$i" in
		"$0")
    		continue
    		;;
		-i=*|--input=*)
   			input="${i#*=}" && input="${input/\\/}" && input="${input%${input##*[![:space:]]}}"   
   			;;
   		-o=*|--output=*)
   			output="${i#*=}" && output="${output/\\/}" && output="${output%${output##*[![:space:]]}}"
   			;;
   		-m=*|--mode=*)
   			mode="${i#*=}"
   			;;
   		-cl=*|--compression-level=*)
   			compression_level="${i#*=}"
   			if [[ ! "$compression_level" =~ ^[1-9]$ ]];then
   				catch_err "5" "" "$compression_level" && $exit_mode $error_code
   			fi
   			;;
   		*)
   			catch_err "3" "" "$i" && $exit_mode $error_code
   			;;
		esac
	done
fi

# Perform archive actions
if [ ! -z "$input" ];then
	if [ "$mode" == "archive" ] || [ -z $mode ];then
		if [ -e "$input" ];then
			if [ "$output" == "STDOUT" ] || [ -z "$output" ];then
				tar -cC "${input%/*}" "${input##*/}" | gzip -cf "-$compression_level"
			else
				mkdir -p "${output%/*}" 
				tar -cC "${input%/*}" "${input##*/}" | gzip -f "-$compression_level" > "$output"
			fi
		else
			catch_err "2" "" "$input" && $exit_mode $error_code
		fi
	elif [ "$mode" == "unarchive" ];then
		mkdir -p "$output"
		cat "$input" | gzip -d | tar -xC "$output"
	else
		catch_err "4" "" "$mode" && $exit_mode $error_code
	fi
else
	catch_err "1" && $exit_mode $error_code
fi