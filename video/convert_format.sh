#!/bin/bash

ffmpeg -i $1 -c:v mjpeg -c:a aac $2
