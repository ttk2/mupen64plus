# Compiling Mupen64Plus from source code under Linux #

This guide is for people who want to play with the latest Mupen64Plus code under development, by grabbing the source code from our development repository and compiling it yourself.

## Requirements ##

  * Build environment (GCC, G++, GNU Make, pkg-config, etc)
  * Git distributed SCM
  * Development packages for dependencies
    1. SDL 1.2 or 2.0
    1. libpng
    1. FreeType 2
    1. zlib
    1. OpenGL (GL, glu)
    1. Boost (for glide64mk2 video plugin)
  * Optional development packages for dependencies
    1. libsamplerate
    1. libspeexdsp
    1. liblircclient

## Installing Git ##

If you do not have git installed, launch your favorite application manager and search for **git**. If you are on Ubuntu or Debian this line will work in the console:

`$ sudo apt-get install git`

## Checking out, building, and updating the source code ##

Part of the re-design of our emulator has involved breaking it up from a single big package into 6 separate modules which must all be built separately.  In order to make this easier for developers, I have written a few simple shell scripts for checking out and building the code.  You make download an archive of the scripts here:

[m64p\_helper\_scripts.tar.gz](https://github.com/mupen64plus/mupen64plus-core/raw/master/tools/m64p_helper_scripts.tar.gz) (updated Dec 18, 2013)

To check out, build, and run the new Mupen64Plus code, unzip these scripts into an empty directory and run:

`./m64p_get.sh && ./m64p_build.sh && ./m64p_test.sh`

If, at a later time, you want to pull the latest changes and rebuild all of the code, you may do the following:

`./m64p_update.sh && ./m64p_build.sh`

The build script will create a `test` directory and place all of the necessary files there.  You can go into this directory and run the console front-end (named `mupen64plus`) to run ROMs.

## Custom Builds ##

The makefiles of the Mupen64Plus modules support many different compile-time options.  Some of these options are specific to a single module, while others are common to several modules.  You can build the modules individually, passing options to the makefile in the `projects/unix/` folder of the module, or you can append options to the `./m64p_build.sh` script and build all the modules with the same options.

### Common Options ###
```
  General Options:
    BITS=32       == build 32-bit binaries on 64-bit machine
    APIDIR=path   == path to find Mupen64Plus Core headers
    OPTFLAGS=flag == compiler optimization (default: -O3)
    PIC=(1|0)     == Force enable/disable of position independent code
  Install Options:
    PREFIX=path   == install/uninstall prefix (default: /usr/local)
    SHAREDIR=path == path to install shared data files (default: PREFIX/share/mupen64plus)
    LIBDIR=path   == library prefix (default: PREFIX/lib)
    PLUGINDIR=path == path to install plugin libraries (default: LIBDIR/mupen64plus)
    DESTDIR=path  == path to prepend to all installation paths (only for packagers)
  Debugging Options:
    DEBUG=1       == add debugging symbols
    V=1           == show verbose compiler output
```

### Mupen64Plus-Core Only ###
```
  General Options:
    LIRC=1        == enable LIRC support
    NO_ASM=1      == build without assembly (no dynamic recompiler or MMX/SSE code)
    SHAREDIR=path == extra path to search for shared data files
    OSD=(1|0)     == Enable/disable build of OpenGL On-screen display
    NEW_DYNAREC=1 == Replace dynamic recompiler with Ari64's experimental dynarec
  Install Options:
    INCDIR=path   == path to install core header files (default: PREFIX/include/mupen64plus)
  Debugging Options:
    PROFILE=1     == build gprof instrumentation into binaries for profiling
    DEBUGGER=1    == build graphical debugger
    DBG_CORE=1    == print debugging info in r4300 core
    DBG_COUNT=1   == print R4300 instruction count totals (64-bit dynarec only)
    DBG_COMPARE=1 == enable core-synchronized r4300 debugging
    DBG_PROFILE=1 == dump profiling data for r4300 dynarec to data file
```

### Mupen64Plus-Audio-SDL Only ###

```
  General Options:
    NO_OSS=1      == build without OSS; disables Open Sound System support
    NO_SRC=1      == build without libsamplerate; disables src-* high-quality audio resampling
    NO_SPEEX=1    == build without libspeexdsp; disables speex-* high-quality audio resampling
```

### Mupen64Plus-Input-SDL Only ###

```
  Debugging Options:
    PLUGINDBG=1   == print extra debugging information while running
```

### Mupen64Plus-UI-Console Only ###

```
  General Options:
    COREDIR=path   == default path to search for Mupen64Plus Core (must end with slash)
    PLUGINDIR=path == default path to search for plugins
    SHAREDIR=path  == default path to search for shared data files
    PIE=(1|0)      == Force enable/disable of position independent executables
  Install Options:
    BINDIR=path    == path to install mupen64plus binary (default: PREFIX/bin/)
    MANDIR=path    == path to install mupen64plus manual page (default: PREFIX/share/man)
```

### Mupen64Plus-Video-Rice Only ###

```
  General Options:
    NO_ASM=1      == build without inline assembly code (x86 MMX/SSE)
```