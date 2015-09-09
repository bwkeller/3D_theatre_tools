# Tools for Swinburne AstroTour Theatres

This toolkit is a set of scripts to help build custom content for the 3D
Theatres using the Swinburne Center for Astrophysics  and supercomputing's
AstroTour system.  These tools depend on ImageMagick and ffmpeg, you will need
to have them installed to use the image and video tools respectively.

### [Manual for adding custom content](https://github.com/bwkeller/3D_theatre_tools/blob/master/Making_Custom_Content.md)

## Image tools
AstroTour requires images to be in a Truevision TGA format, with 8 bit Direct color.
A separate image file is used for the left & right eyes.

### anaglyph_to_LR.sh
This script pulls the two color channels used in anaglyphic (red-blue) 3D images
into two separate image files that can be used with AstroTour

### unstitch_LR.sh
This script splits images that have both the left and right eye stitched into a
single image into a pair of images.

### fix_imageclass.sh
This script can fix the color class in images that use pseudoclass color, and
cannot be viewed in AstroTour.

## Video tools
AstroTour plays movies differently than images.  Rather than a separate file for
each eye, a stitched video twice as wide as each eye will see is used.

### convert_format.sh
AstroTour requires videos to use an MJPEG video codec along with AAC for audio.
This script will convert a video to using this format.

### horizontal_to_vertical.sh
Some 3D systems use a horizontal rather than vertical tiling for left & right
eye.  This script will convert a horizontally tiled video to a vertically tiled
one.

### add_text.sh
This adds a 3 second black screen with some text to the end of a video.  Useful
for adding credits.
