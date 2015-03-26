#!/bin/bash
font=/usr/share/fonts/truetype/freefont/FreeSerif.ttf
inw=`ffprobe -v quiet -show_streams -select_streams v:0 $1 | grep width | sed -e 's/width=//'`
inh=`ffprobe -v quiet -show_streams -select_streams v:0 $1 | grep height | sed -e 's/height=//'`
insar=`ffprobe -v quiet -show_streams -select_streams v:0 $1 | grep sample_aspect_ratio | sed -e 's/sample_aspect_ratio=//' | sed -e 's/\:/\//'`
infps=`ffprobe -v quiet -show_streams -select_streams v:0 $1 | grep r_frame_rate | sed -e 's/r_frame_rate=//'`
ffmpeg -f lavfi -i aevalsrc=0:d=3 -f lavfi -i color=c=black:s="$inw"x"$inh":sar="$insar":r=$infps:d=3 -vf drawtext="fontfile=$font: fontcolor=white: fontsize=80: x=(w/2-text_w)/2: y=(h-text_h-line_h)/2: textfile=$2" -c:v mjpeg -c:a aac -strict -2 tmp.mp4
ffmpeg -i tmp.mp4 -vf drawtext="fontfile=$font: fontcolor=white: fontsize=80: x=3*w/4-text_w/2: y=(h-text_h-line_h)/2: textfile=$2"  -c:v mjpeg -c:a aac  -strict -2 text.mp4
ffmpeg -i $1 -i text.mp4 -filter_complex '[0:0] [1:0] concat=n=2:v=1:a=0 [v]' -map '[v]' -c:v mjpeg -c:a aac $3
rm tmp.mp4
rm text.mp4
