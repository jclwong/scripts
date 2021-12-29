#!/bin/sh
#
# Given a 1024x1024 image, resize to all required iOS app icon sizes
#

bash lib-check-image-magick; if [ $? -eq 1 ]; then exit 1; fi

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

if [ -n "$fileFullName" ] ; then

	# Strip(reconvert) non-standard PNG (Left by amazing Photoshop.)
	if [ $fileExt == "png" ] ; then
		convert "$fileFullName" -strip "$fileFullName"
	fi

	fileNameExtended="_20pt_1x"
	convert "$fileName.$fileExt" -resize "20x20"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_20pt_2x"
	convert "$fileName.$fileExt" -resize "40x40"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_20pt_3x"
	convert "$fileName.$fileExt" -resize "60x60"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_29pt_1x"
	convert "$fileName.$fileExt" -resize "29x29"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_29pt_2x"
	convert "$fileName.$fileExt" -resize "58x58"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_29pt_3x"
	convert "$fileName.$fileExt" -resize "87x87"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_40pt_1x"
	convert "$fileName.$fileExt" -resize "40x40"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_40pt_2x"
	convert "$fileName.$fileExt" -resize "80x80"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_40pt_3x"
	convert "$fileName.$fileExt" -resize "120x120"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_60pt_2x"
	convert "$fileName.$fileExt" -resize "120x120"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_60pt_3x"
	convert "$fileName.$fileExt" -resize "180x180"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_76pt_1x"
	convert "$fileName.$fileExt" -resize "76x76"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_76pt_2x"
	convert "$fileName.$fileExt" -resize "152x152"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_83-5pt_2x"
	convert "$fileName.$fileExt" -resize "167x167"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"

	fileNameExtended="_1024"
	convert "$fileName.$fileExt" -resize "1024x1024"\> "$fileName$fileNameExtended.png"
	printf "Converting: "" "$fileName"$fileNameExtended""."$fileExt" ...... done\n"
fi


printf "All done!\n\n"
