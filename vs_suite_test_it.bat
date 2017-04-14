@echo off
REM Misc -> VWshare -> Video Tools -> FFMPEG.cs

REM Snapshot
.\ffmpegVS -ss 00:00:05 -y -i testVid.mpg -vframes 1 -f image2 outSnapshot.png
.\ffmpegVS -ss 00:00:02 -y -i testVid.mpg -vframes 1 -f image2 outSnapshot.jpg

REM Grab video
.\ffmpegVS -y -i testVid.mpg -vcodec copy -acodec copy -ss 00:00:03 -t 5 outGrabVid.mpg
.\ffmpegVS -y -i testVid.mpg -ss 00:00:06 -t 4 outGrabVid.mp4

REM Web optimise
.\ffmpegVS -y -i testVid.mpg -movflags faststart -acodec copy -vcodec copy outWebop.mpg
.\ffmpegVS -y -i testVid.mpg -movflags faststart outWebop.mp4
