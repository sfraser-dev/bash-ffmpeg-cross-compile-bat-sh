#!/bin/bash
# usage: 
# ./runme --file="cross_compile_ffmpeg_minimal.sh" --sandbox="ffmpeg" --xcomp="xc" --lib="dll or static"

PWD=$(pwd)

# parse the command line
for i in "$@"
do
  case $i in
    -f=*|--file=*)
    FILE2RUN="${i#*=}"
    ;;
    -s=*|--sandbox=*)
    SANDBOX="${i#*=}"
    ;;
    -x=*|--xcomp=*)
    XCOMP="${i#*=}"
    ;;
    -l=*|--libtype=*)
    LIBTYPE="${i#*=}"
    ;;
    *)
      # unknown option
      echo "error: unknow command line option $i ... exiting"
      exit 1
    ;;
  esac
done
if [ -z $FILE2RUN ] || [ -z $SANDBOX ] || [ -z $XCOMP ] || [ -z $LIBTYPE ] ; then
    echo "error, must set directory names for file2run (--file=\"\"), sandbox (--sandbox=\"\"), cross-compiler (--xcomp=\"\") and library type (--libtype=\"\") ... exiting"
  exit 1
fi

# static of shared (dll) build?
STATIC=
SHARED=
if [ $LIBTYPE == "dll" ] ; then
  STATIC="n"
  SHARED="y"
  DATFILE="outputDll.dat"
elif [ $LIBTYPE == "static" ] ; then
  STATIC="y"
  SHARED="n"
  DATFILE="outputStatic.dat"
else
  echo "error, --libtype must equal dll or static ... exiting"
  exit 1
fi

# deconstruct the name of the ffmpeg-windows-build-helper file 
FILE2RUN_EXTN="${FILE2RUN##*.}"
FILE2RUN_BASE="${FILE2RUN%.*}"
echo "FILE2RUN_EXTN = $FILE2RUN_EXTN"
echo "FILE2RUN_BASE = $FILE2RUN_BASE"

# does the ffmpeg-windows-build-helper file exist?
if [ ! -e $FILE2RUN ] ; then
  echo "error, file $FILE2RUN doesn't exist ... exiting"
  exit 1
fi

# cross compile 
source ./$FILE2RUN --build-ffmpeg-static=$STATIC --build-ffmpeg-shared=$SHARED --enable-gpl=n --disable-nonfree=y --git-get-latest=n --prefer-stable=y --build-intel-qsv=y --build-dvbtee=n --build-mp4box=n --build-mplayer=n --build-vlc=n --build-lsw=n --build-x264-with-libav=n --ffmpeg-git-checkout-version= --build-ismindex=n --sandboxdir=$SANDBOX --xcompdir=$XCOMP 2>&1 | tee $DATFILE

# get resultant bin files
NOW=$(date +"%y%m%d-%H%M%S")
BIN_DIR_NAME="${PWD}/bin_files/${NOW}_${LIBTYPE}_${FILE2RUN_BASE}"
if [ ! -d "$BIN_DIR_NAME" ]; then
  mkdir -p "$BIN_DIR_NAME"
else
  echo "error: directory $BIN_DIR_NAME already exists ... exiting"
  exit 1
fi
if [ $LIBTYPE == "dll" ] ; then
  cp $PWD/$SANDBOX/$XCOMP/mingw-w64-i686/i686-w64-mingw32/bin/*.dll $BIN_DIR_NAME
fi
cp $PWD/$SANDBOX/$XCOMP/mingw-w64-i686/i686-w64-mingw32/bin/ffmpeg.exe $BIN_DIR_NAME
cp $PWD/$SANDBOX/$XCOMP/mingw-w64-i686/i686-w64-mingw32/bin/ffplay.exe $BIN_DIR_NAME
cp $PWD/$SANDBOX/$XCOMP/mingw-w64-i686/i686-w64-mingw32/bin/ffprobe.exe $BIN_DIR_NAME
