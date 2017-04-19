#!/usr/bin/env bash

# Build FFmpeg as shared DLL

# minimal build
source ./cross_compile_ffmpeg_minimal.sh --build-ffmpeg-static=n --build-ffmpeg-shared=y --enable-gpl=n --disable-nonfree=y --git-get-latest=n --prefer-stable=y --build-intel-qsv=y --build-dvbtee=n --build-mp4box=n --build-mplayer=n --build-vlc=n --build-lsw=n --build-x264-with-libav=n --ffmpeg-git-checkout-version= --build-ismindex=n 2>&1 | tee outputInfoDLLFrom_cross_compile_ffmpeg.sh.dat
