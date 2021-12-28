#!/bin/sh
#
# Resize a large iOS launch screen image to all required sizes
#

# ================================================
# ==========[ Arguments Validity Check ]==========
# ================================================

if [ "$#" -ne 1 ]; then
	echo "Error: Incorrect number of arguments"
	echo "Usage: ./imgRsz.sh image_file_name"
	exit 1
fi

fileFullName=`echo $1|grep -i ".png\|.jpg\|.jpeg\|.gif"`
fileName="${fileFullName%.*}"
fileExt="${fileFullName##*.}"

echo "Begin Conversion: ""$fileFullName"


if [ ! -f "$fileFullName" ] ; then
	echo "Error: Image file specified does not exist"
	exit 1
fi

# ==================================
# ==========[ Conversion ]==========
# ==================================


if [ -n "$fileFullName" ] ; then

	# Strip(reconvert) non-standard PNG (Left by amazing Photoshop.)
	if [ $fileExt == "png" ] ; then
		convert "$fileFullName" -strip "$fileFullName"
	fi

	fileNameExtended="_320_480"
	convert "$fileName.$fileExt" -resize "320x480"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_640_960"
	convert "$fileName.$fileExt" -resize "640x960"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_640_1136"
	convert "$fileName.$fileExt" -resize "640x1136"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_750_1334"
	convert "$fileName.$fileExt" -resize "750x1334"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_1242_2208"
	convert "$fileName.$fileExt" -resize "1242x2208"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

fi


printf "All done!\n\n"
