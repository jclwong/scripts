#!/bin/sh
#
# Given a large android icon, resize all necessary android sizes
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
fi

# =================================================
# ==========[ Clean / Setup Directories ]==========
# =================================================

declare -a Folders=('drawable-ldpi'	'drawable-mdpi'	'drawable-hdpi'	'drawable-xhdpi'	'drawable-xxhdpi'	'drawable-xxxhdpi');
declare -a Sizes=(	'36x36'			'48x48'			'72x72'			'96x96'				'144x144'			'192x192');

index=0
while [  $index -lt ${#Folders[@]} ]; do
	if [ -d "${Folders[@]:index:1}" ] ; then
		rm -rf "${Folders[@]:index:1}"
	fi
	mkdir "${Folders[@]:index:1}"
	let index=index+1
done

# ==================================
# ==========[ Conversion ]==========
# ==================================

if [ -n "$fileFullName" ] ; then

	# Strip(reconvert) non-standard PNG (Left by amazing Photoshop.)
	if [ $fileExt == "png" ] ; then
		convert "$fileFullName" -strip "$fileFullName"
		mv "$fileFullName" "temp_$fileFullName"
	fi

	# go through previously-defined arrays to convert and put into correct folder
	index=0
	while [  $index -lt ${#Folders[@]} ]; do
		convert "temp_$fileFullName" -resize "${Sizes[@]:index:1}"\> "$fileName.png"
		mv "$fileName.png" "${Folders[@]:index:1}"
		printf "Converting:  $fileName.$fileExt ...... done\n"
		let index=index+1
	done

	# return the temp file name back to original name
	mv "temp_$fileFullName" "$fileFullName"
fi

printf "All done!\n\n"
