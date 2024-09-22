# FFmpeg Cross Compile

Adapting the shell script from:
<https://github.com/rdp/ffmpeg-windows-build-helpers>
This is a shell script for cross compiling FFmpeg (building Windows .exe's on Debian Linux).   

On Debian (Jessie) 32 bit (Linux kernel is: 3.16.0-4-686-pae):   
Created cross compiled ffmpeg.exes for Windows 32 bit and Windows 64 bit architectures   
          
Example usage:  

- `mkdir /usr/media`   
    - `sudo chown user:user /usr/media`  
- `cd /usr/media`
- `git clone https://weebucket@bitbucket.org/weebucket/ffmpegcrosscompile.git .`

## DLL and Static

Run the wrapper script for the ffmpeg-windows-build-help script, for example:

DLL:

- build a shared FFmpeg DLL using the script "crossCompileFfmpegMinimal.sh"  
      - sandbox dir hardcoded to "ffmpeg" and the cross-compiler directory hard-coded to "xc"
- run\_ffmpeg\_cross\_compiler --sandbox="ffmpeg" --xcomp="xc" --lib="dll" --file="crossCompileFfmpegMinimal.sh"   
- results in ->   
    - bin\_files\timestamp\_dll\_crossCompileFfmpegMinimal   

Static:

- build a static FFmpeg using the script "crossCompileFfmpegMedialooks.sh"   
- (sandbox dir hardcoded to "ffmpeg" and the cross-compiler directory hard-coded to "xc")   
- run\_ffmpeg\_cross\_compiler --sandbox="ffmpeg" --xcomp="xc" --lib="static" --file="crossCompileFfmpegMedialooks.sh"    
- results in ->   
    - bin\_files\timestamp\_dll\_crossCompileFfmpegMinimal   
