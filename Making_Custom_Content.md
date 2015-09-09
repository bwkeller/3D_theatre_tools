# Making Custom Content Swinburne AstroTour Theatres
The astrotour 3D Theatre interface allows you to easily add in new content in
the form of videos, images, and even applications.  This short manual is a
guide to adding your own content to your own installation of astrotour.

## The Astrotour Directory Structure
Your astrotour should reside in a single directory, possible `~/swinburne`.
Within this directory, we have a number of files and menus:

```
astrosync.sh
astrotour/
bin/
config/
custom/
s2plot/
```
The important directories for us are `astrotour/` and `custom/`.  These are
going to contain both configuration files we will need to edit to add our
content, and the content itself once we've added it.

Both of these directories contain an identical set of subdirectories as
follows:

```
Apps/
Menus/
Movies/
```
While these are fairly self-explanatory, it's important to note that still 
images are actually contained in the `Apps/` directory.

## The Astrotour Menu System
The menus that astrotour presents are defined using a series of xml files.  
The main menu that is presented by astrotour is defined by `config/AstroTour.xml`.
The skeleton xml file looks like this:

```
<?xml version="1.0" encoding='UTF-8'?>
<menu title="">AstroTour
  <language>English</language>
  <resolution>SD</resolution>
  <units>Metric</units>
  <background>AstroTourMenuBackground</background>
  <pixelbufs>false</pixelbufs>
  <mode>letterbox</mode>
</menu>
```

This of course gives you nothing useful, but you can add menu subdirectories
using the `<menu>` tag.  Thumbnails for menus are contained in the `Menus/`
subdirectory.  So, for example, if you want to add a menu called "Foo", with a
thumbnail (these must have filename `icon.png` in `custom/Menus/Bar`, you would
use the tag:

```
<menu title="Foo">Bar
</menu>
```
The basic tag syntax is `<tag title="Display Title">ThumbNailDirectory</tag>`.
In additional to menu subdirectories, you can add videos using the `<mov>`
title, apps and images using the `<app>` tag, and even scripts of presentation
elements using the `<show>` tag.

## Adding Content
### Images
Images should be put in `custom/Apps`, with a subdirectory for the image/set of
images.  If multiple images are added to an app directory, they can be scrolled
through using the space bar.  You need to include a pair of images (one for
each eye), though these can be simply copies of each other if the image is 2D.
They also need to be tga images with the correct color class
(`image/fix_imageclass.sh` in this toolkit can convert images to this.)  Once
the images are there, you also need to include in the directory an `icon.png` 
for the thumbnail, a plain text file called `list`, with each set of images
as a row, with left/right eye as columns.  An example might look like this:

```
lorem_left.png lorem_right.png
ipsum_left.png ipsum_right.png
```

You will also need a script called `runme.sh`, that is identical for all image
sets (you can copy it from another image directory if you like):

```
#!/bin/sh
if [ -f "${HOME}/swinburne/config/AstroTour.sh" ]; then
  source ${HOME}/swinburne/config/AstroTour.sh
fi
s2slides $S2PLOT_STEREOCONF $WINDOWCONF list
```

## Videos
Videos are actually much simpler than images.  Instead of making a directory in
`custom/Apps`, we make one in `custom/Movies`.  Again, we include an `icon.png` 
for a thumbnail, and in this case, all we do is put the movie file in the directory.
The movie must be encoded with MJPEG for the video stream, and aac for the audio.
The `video/convert_format.sh` tool can automatically convert videos for you.
