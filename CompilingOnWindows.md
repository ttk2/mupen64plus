# Compiling Mupen64Plus in Windows #

This guide is for people who want to play with the latest Mupen64Plus code under development, by grabbing the source code from our development repository and compiling it yourself.

## Requirements ##

  * Build environment (Visual Studio 2013)
  * Git client (http://git-scm.com/downloads/guis)

## Instructions ##

1. Use your Git client client to clone the following repositories (put them all in the same parent directory):

  * https://github.com/mupen64plus/mupen64plus-audio-sdl.git
  * https://github.com/mupen64plus/mupen64plus-core.git
  * https://github.com/mupen64plus/mupen64plus-input-sdl.git
  * https://github.com/mupen64plus/mupen64plus-rsp-hle.git
  * https://github.com/mupen64plus/mupen64plus-ui-console.git
  * https://github.com/mupen64plus/mupen64plus-video-glide64mk2.git
  * https://github.com/mupen64plus/mupen64plus-video-rice.git
  * https://github.com/mupen64plus/mupen64plus-rom.git
  * https://github.com/mupen64plus/mupen64plus-win32-deps.git

2. Open up the Visual Studio solution file at: mupen64plus-ui-console\projects\msvc8\mupen64plus-ui-console.sln

3. Build it in Debug or Release mode

4. Run it.  You can get m64p\_test\_rom.v64 test ROM file from mupen64plus-rom\ and drop it into the build directory, then click the "Run" button in visual studio.  Or, you can open a DOS shell and 'cd' to the build dir and run your own roms with "mupen64plus-ui-console.exe \path\to\my\rom.z64".