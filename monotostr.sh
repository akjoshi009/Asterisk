#!/bin/sh
# create stereo wav out of two mono wav-files
# source files will be deleted
#
# 2022 05 23 Sachin Anbhule/Jaydeep Chauhan 
#
# usage: monotostr <wave1> <wave2> <wave3>
# designed for Asterisk Monitor(file,format,option) where option is "e" and
# the variable 
# debuging...
logfile=/var/spool/asterisk/2wav-error
exec > $logfile 2>&1
# command line variables
LEFT="$1"
RIGHT="$2"
OUT="$3"
#OUT="${OUT%.wav}"

#test if input files exist
test ! -r $LEFT && exit
test ! -r $RIGHT && exit

echo "File exist"

echo $LEFT
echo $RIGHT
echo $OUT

ffmpeg -i  $LEFT -i $RIGHT -filter_complex "[0:a][1:a]join=inputs=2:channel_layout=stereo[a]" -map "[a]" $OUT

#remove temporary files
rm $LEFT && rm $RIGHT
echo "File deleted Succesfully"

