#!/bin/bash

convert $1 -channel R -separate `echo $1 | cut -d'.' -f 1`_l.tga
convert $1 -channel R -evaluate set 0 -colorspace Gray `echo $1 | cut -d'.' -f 1`_r.tga
