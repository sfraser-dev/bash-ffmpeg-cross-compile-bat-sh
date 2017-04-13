Adapting the shell script from:
https://github.com/rdp/ffmpeg-windows-build-helpers   
This is a shell script for cross compiling FFmpeg (building Windows .exe's on Debian Linux).   


On Debian (Jessie) 32 bit (Linux kernel is: 3.16.0-4-686-pae):   
Created cross compiled ffmpeg.exes for Windows 32 bit and Windows 64 bit architectures
      
    
Example usage:  
mkdir /usr/media   
(sudo chown user:user /usr/media)   
cd /usr/media   
git clone https://weebucket@bitbucket.org/weebucket/ffmpegcrosscompile.git .   
source ./run\_ffmpeg\_cross\_compiler.sh (wrapper for the adapted ./cross\_compile\_ffmpeg.sh shell script)   
... results in ->   
--ffmpeg/win32 (32 bit source code and build directories for ffmpeg and external libraries)   
--ffmpeg/x86\_64 (64 bit source code and build directories for ffmpeg and external libraries)   
--ffmpeg/xcomp (cross-compiler (libs, libs/pkgconfig, includes, exes))   


