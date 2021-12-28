#!/bin/sh
#
# Convert a gif into a sequence of independent png's
#
# Prerequisites: ImageMagick
# Arguments: DELAY (-reversed) DIRPATH
# Accepts: 	png, jpg, jpeg, gif
# Outputs: 	png
#

# ================================================
# ==========[ Arguments Validity Check ]==========
# ================================================

echo "Crop:    convert input.gif -coalesce -repage 0x0 -crop WxH+X+Y +repage output.gif"
echo "Pngs:    convert input.gif output_.png"
#convert input.gif -coalesce -repage 0x0 -crop WxH+X+Y +repage output.gif
