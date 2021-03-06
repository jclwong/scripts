#!/bin/sh
#
# Convert a gif into a sequence of independent png's
#
# Prerequisites: ImageMagick
# Arguments: DELAY (-reversed) DIRPATH
# Accepts: 	png, jpg, jpeg, gif
# Outputs: 	png
#

bash lib-image-magick-check; if [ $? -eq 1 ]; then exit 1; fi

# ================================================
# ==========[ Arguments Validity Check ]==========
# ================================================

echo "Crop:    convert input.gif -coalesce -repage 0x0 -crop WxH+X+Y +repage output.gif"
echo "Pngs:    convert input.gif output_.png"
#convert input.gif -coalesce -repage 0x0 -crop WxH+X+Y +repage output.gif
