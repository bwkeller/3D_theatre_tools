#!/bin/bash

convert $1  -gravity West -crop 50%x100%+0+0 `echo $1 | cut -d'.' -f 1`_l.tga
convert $1  -gravity East -crop 50%x100%+0+0 `echo $1 | cut -d'.' -f 1`_r.tga
