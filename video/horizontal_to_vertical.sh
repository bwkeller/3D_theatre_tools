#!/bin/bash

ffmpeg -i $1 -vf "stereo3d=abl:sbsl" prescaled_$1
ffmpeg -i prescaled_$1 -vf "scale=w=iw:h=9/32*iw" -c:v mjpeg -c:a aac $2/$1
rm prescaled_$1
