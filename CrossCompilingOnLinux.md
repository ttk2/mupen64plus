# Compiling Mupen64Plus from source code under Linux for Windows #

This guide is for people who want to play with the latest Mupen64Plus code under development, by grabbing the source code from our development repository and compiling it yourself for Windows.

## Requirements ##

  * Build environment (GCC, G++, GNU Make, pkg-config, etc)
  * Mercurial distributed SCM
  * GIT distributed SCM
  * Common build dependencies
    1. scons
    1. yasm
    1. autoconf/automake
    1. wget
    1. bison
    1. cmake
    1. flex
    1. intltool
    1. libtool
    1. pkg-config
    1. unzip

## Installing MXE ##

MXE (M cross environment) is used here to provide the build environment to generate Windows binaries of mupen64plus. It provides build scripts to build all dependencies and therefore a simple build environment for the first compile steps must already be available.

First the scripts must be retreived using Git

```
git clone -b stable http://github.com/mxe/mxe.git
```

It is important to make SDL a shared library used by the plugins, ui and core.
The mxe/src/sdl.mk build script has to be modified to not include the
"--disable-shared" line.

```
--- a/src/sdl.mk
+++ b/src/sdl.mk
@@ -19,7 +19,6 @@ define $(PKG)_BUILD
     $(SED) -i 's,-mwindows,-lwinmm -mwindows,' '$(1)/configure'
     cd '$(1)' && ./configure \
         --host='$(TARGET)' \
-        --disable-shared \
         --prefix='$(PREFIX)/$(TARGET)' \
         --enable-threads \
         --enable-directx \
```

Now it is possible to build the dependencies

```
make -C mxe gcc sdl libpng freetype speex libsamplerate pthreads freeglut glew zlib boost
```

It is also possible to speed up the build by  [using more Cores/CPUs](http://mxe.cc/#usage).

After the build finished, the path to the new build tools has to be stored in the PATH environment variable of the current shell session.

```
export PATH="$(pwd)/mxe/usr/bin/:$PATH"
```

## Checking out, building, and updating the source code ##

The general principle of getting the source and checking it out is explained in [[CompilingFromHg](CompilingFromHg.md)]. We only have to make sure that the path to the build tools is still stored in the PATH environment variable of the current shell session. Additionally an extra option for the type for the cross compiler (i686-pc-mingw32-), the CPU type (i686) and the OS type (MINGW) has to be given to the scripts.

```
./m64p_get.sh
./m64p_build.sh CROSS_COMPILE=i686-pc-mingw32- HOST_CPU=i686 UNAME=MINGW
```

Don't forget to copy the SDL.dll from mxe/usr/i686-pc-mingw32/bin/SDL.dll into
the test directory (otherwise mupen64plus cannot find it).

## Building extra plugins ##

It is possible to build extra components previously downloaded. For example the extra plugins from wahrhaft can be retrieved and build after ./m64p\_get.sh was run.

```
M64P_COMPONENTS="rsp-z64 video-arachnoid video-glide64 video-z64 rsp-cxd4" ./m64p_get.sh
M64P_COMPONENTS="rsp-z64 video-arachnoid video-glide64 video-z64 rsp-cxd4" ./m64p_build.sh CROSS_COMPILE=i686-pc-mingw32- HOST_CPU=i686 UNAME=MINGW
M64P_COMPONENTS="rsp-z64" ./m64p_build.sh CROSS_COMPILE=i686-pc-mingw32- HOST_CPU=i686 UNAME=MINGW HLEVIDEO=1
M64P_COMPONENTS="rsp-cxd4" ./m64p_build.sh CROSS_COMPILE=i686-pc-mingw32- HOST_CPU=i686 UNAME=MINGW SSE=SSSE3
M64P_COMPONENTS="rsp-cxd4" ./m64p_build.sh CROSS_COMPILE=i686-pc-mingw32- HOST_CPU=i686 UNAME=MINGW SSE=none
```

## Building x86\_64 testbuilds for windows ##

The support for x86\_64 is not yet integrated in MXE but development was started by tonytheodore. His development can be obtained and build using

```
git clone -b multi-target https://github.com/tonytheodore/mxe.git mxe-multi-target
make MXE_TARGETS=x86_64-w64-mingw32  -C mxe-multi-target gcc sdl libpng freetype speex libsamplerate pthreads freeglut glew zlib
export PATH="$(pwd)/mxe-multi-target/usr/bin/:$PATH"
```

The parameters for m64p\_build.sh also have to be changed slightly

```
./m64p_get.sh
./m64p_build.sh CROSS_COMPILE=x86_64-w64-mingw32- HOST_CPU=x86_64 UNAME=MINGW
```

## Building wxmupen64plus for windows ##

wxmupen64plus needs wxwidgets >= 2.9. This is shipped in tonytheodore's mxe-multi-target branch. It just has to be compiled

```
make -C wxwidgets
```

wxmupen64plus uses a different build system which needs to be configured slightly different. And the data files aren't automatically copied.

```
hg clone --cwd ./source/ https://bitbucket.org/auria/wxmupen64plus
(MXE="$(pwd)/mxe";BASE="$(pwd)"; target=i686-pc-mingw32; cd source/wxmupen64plus/ && WINDRES=${target}-windres CC="${target}-gcc" CXX="${target}-g++" ./waf configure --wxinclude="${MXE}/usr/${target}/include/wx-2.9/" --wxconfig="${target}-wx-config-nounicode" --mupenapi="${BASE}/source/mupen64plus-core/src/api/" --sdlconfig="${target}-sdl-config" --wxhome="${MXE}/usr/${target}/" --targetos=windows --debugger=false --prefix=/ --bindir=/ --datadir=wxm64pdata/  && ./waf && ./waf --destdir="${BASE}/test/" install)
cp -r ./source/wxmupen64plus/data ./test/wxm64pdata
```

## Why must the SDL.dll be a shared library/dll? ##

SDL has an implicit global state (a state not managed by the user of the library). Such a state is always bound to library and SDL initialises it on windows by overwriting the main function of the program (mupen64plus-ui-console). Each plugin would have its own version of the SDL library when it is linked as static library. Thus each plugin would have its own global state and only the global state of mupen64plus-ui-console is initialised. All other SDL libraries would have only parts of the information available and some calls to the library would fail in one plugin but work correctly in another one.

Using a common, shared SDL library as DLL is currently the only way to avoid such problems.