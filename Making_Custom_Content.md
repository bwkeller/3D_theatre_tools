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
thumbnail in `custom/Menus/Bar`, you would use the tag:

```
<menu title="Foo">Bar
</menu>
```
The basic tag syntax is `<tag title="Display Title">ThumbNailDirectory</tag>`.
In additional to menu subdirectories, you can add videos using the `<mov>`
title, apps and images using the `<app>` tag, and even scripts of presentation
elements using the `<show>` tag.
## Adding Images
## Adding Videos
## Custom Shows
