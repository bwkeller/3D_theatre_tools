#!/bin/bash

ffmpeg -i $1 -vf "movie=$2 [in1]; [in]pad=iw*2:iw[in0]; [in0][in1] overlay=w:0 [out]" -c:v mjpeg -c:a aac $3
