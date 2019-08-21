#!/bin/bash -e

country=all
proto=https
ipv=4

function print_help {
	echo "Parameters:
	-c <country>    Default: all
	-p <protocol>   http or https; Default: https
	-v <IP version> 4 or 6; Default: 4
	-h              Print help text"
}

while [ "$#" -gt 0 ]
do
	opt=$1
	case $opt in
		-c)
			country=$2
			shift 2
		;;
		-p)
			proto=$2
			shift 2
		;;
		-v)
			ipv=$2
			shift 2
		;;
		*)
			print_help
			exit
		;;
	esac
done

set -v

curl "https://www.archlinux.org/mirrorlist/?country=${country}&protocol=${proto}&ip_version=${ipv}" |\
         sed "s/^#//" | grep -v "#" | rankmirrors -n 10 -
