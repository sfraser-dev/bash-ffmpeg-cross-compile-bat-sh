Adapting the shell script from:
https://github.com/rdp/ffmpeg-windows-build-helpers   
This is a shell script for cross compiling FFmpeg (building Windows .exe's on Debian Linux).  
   
      
Example usage:  
mkdir /usr/media   
(sudo chown user:user /usr/media)   
cd /usr/media   
git clone https://weebucket@bitbucket.org/weebucket/ffmpegcrosscompile.git .   
source ./cross\_compile\_ffmpeg.sh (adapted shell script; different, more concise, directory structure)   
... results in ->   
--xffmpeg/win32 (source code for ffmpeg and external libraries)   
--xffmpeg/xcomp (cross-compiler (libs, libs/pkgconfig, includes, exes))   


