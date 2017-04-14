#!/usr/bin/env bash

# DLL
./cross_compile_ffmpeg.sh --build-ffmpeg-static=n --build-ffmpeg-shared=y --enable-gpl=n --disable-nonfree=y --git-get-latest=n --prefer-stable=y --build-intel-qsv=y --build-dvbtee=n --build-mp4box=n --build-mplayer=n --build-vlc=n --build-lsw=n --build-x264-with-libav=n --ffmpeg-git-checkout-version= --build-ismindex=n 2>&1 | tee outputInfoDLLFrom_cross_compile_ffmpeg.sh.dat

# static
#./cross_compile_ffmpeg.sh --build-ffmpeg-static=y --build-ffmpeg-shared=n --enable-gpl=n --disable-nonfree=y --git-get-latest=n --prefer-stable=y --build-intel-qsv=y --build-dvbtee=n --build-mp4box=n --build-mplayer=n --build-vlc=n --build-lsw=n --build-x264-with-libav=n --ffmpeg-git-checkout-version= --build-ismindex=n 2>&1 | tee outputInfoSTATICFrom_cross_compile_ffmpeg.sh.dat
