This README document reflects the instructions for using the latest Mupen64Plus code, which may be unreleased, so if you are using a released version of Mupen64Plus, the most accurate instructions are in the README file included with your release package.

Mupen64Plus is based off of mupen64, originally created by Hacktarux. The Mupen64Plus package contains the mupen64 emulator program (renamed mupen64plus) plus graphics, sound, input, and RSP plugins.

**README Sections**
  1. Requirements for building or running Mupen64Plus
  1. Building From Source
  1. Installation
  1. Multi-user Support
  1. Key Commands In Emulator
  1. Default Key Mappings for SDL-Input Plugin
  1. Known Issues

## 1. Requirements and Pre-requisites ##

**Binary Package Requirements**
  * GTK2 libraries (currently hard plugin dependence even with GUI=NONE)
  * SDL 1.2
  * SDL\_ttf
  * libpng
  * freetype 2
  * zlib

**Source Build Requirements**

In addition to the binary libraries, the following packages are required if you build Mupen64Plus from source:

  * GNU C and C++ compiler, libraries, and headers
  * GNU make
  * Development packages for all the libraries above

Most of these pre-requisites are installed by default, but some are more uncommon. Here is an example for adding the 'SDL\_ttf' development packages on Fedora systems:
```
  # yum install SDL_ttf SDL_ttf-devel
```
And on Debian systems:
```
  # apt-get install libsdl-ttf2.0-0 libsdl-ttf2.0-dev
```

There are also a number of packages required for specific options:

  * libsamplerate (aka Secret Rabbit Code for higher quality audio)
  * binutils-dev (dis-asm.h for debugger)
  * Qt4 libraries and headers (for Qt4 GUI)

## 2. Building From Source ##

If you downloaded the binary distribution of Mupen64Plus, skip to the Installation section.  Otherwise, you will need both the libraries and development packages (header files) for the prerequisites listed above.

Once you have all prerequisites installed, you can build the source distribution by unzipping and cd'ing into the source directory, then build using make:

```
 $ unzip Mupen64Plus-x-y-z-src.zip
 $ cd Mupen64Plus-x-y-z-src
 $ make all
```
Type 'make' by itself to view all available build options:
```
 $ make
 Mupen64Plus makefile. 
   Targets:
     all           == Build Mupen64Plus and all plugins
     clean         == remove object files
     rebuild       == clean and re-build all
     install       == Install Mupen64Plus and all plugins
     uninstall     == Uninstall Mupen64Plus and all plugins
   Options:
     BITS=32       == build 32-bit binaries on 64-bit machine
     VCR=1         == enable video recording
     LIRC=1        == enable LIRC support
     NO_RESAMP=1   == disable libsamplerate support in jttl_audio
     NO_ASM=1      == build without assembly (no dynamic recompiler or MMX/SSE code)
     GUI=NONE      == build without GUI support
     GUI=GTK2      == build with GTK2 GUI support (default)
     GUI=QT4       == build with QT4 GUI support
   Install Options:
     PREFIX=path   == install/uninstall prefix (default: /usr/local/)
     SHAREDIR=path == path to install shared data (default: PREFIX/share/mupen64plus/)
     BINDIR=path   == path to install mupen64plus binary (default: PREFIX/bin/)
     LIBDIR=path   == path to install plugin libs (default: SHAREDIR/plugins/)
     MANDIR=path   == path to install manual files (default: PREFIX/man/man1/)
   Debugging Options:
     PROFILE=1     == build gprof instrumentation into binaries for profiling
     DBGSYM=1      == add debugging symbols to binaries
     DBG=1         == build graphical debugger
     DBG_CORE=1    == print debugging info in r4300 core
     DBG_COUNT=1   == print R4300 instruction count totals (64-bit dynarec only)
     DBG_COMPARE=1 == enable core-synchronized r4300 debugging
     DBG_PROFILE=1 == dump profiling data for r4300 dynarec to data file
```

NOTE: If you want to build a nogui-only version of the Mupen64Plus core (without gtk+ dependencies), pass the GUI=NONE option to make, like this:
```
 $ make GUI=NONE all
```

## 3. Installation ##

**Binary Distribution**

To install the binary distribution of Mupen64Plus, su to root and run the provided install.sh script:
```
 $ su
 # ./install.sh
 # exit
 $
```
The install script will copy the executable to /usr/local/bin and a directory called /usr/local/share/mupen64plus will be created to hold plugins and other files used by mupen64plus.

**Source Distribution**

After building mupen64plus and all plugins, su to root and type 'make install' to install Mupen64Plus. The install process will copy the executable to $PREFIX/bin and a directory called $PREFIX/share/mupen64plus will be created to hold plugins and other files used by mupen64plus. By default, PREFIX is set to /usr/local. This can be changed by passing the PREFIX option to 'make' during the installation.  For example, to install mupen64plus to /usr, do this:
```
 $ make all
 $ su
 # make PREFIX=/usr install
 # exit
 $
```

**Custom Installation Paths**

You may customize the installation of the Mupen64Plus program by using the options for the install.sh script:

```
usage: install.sh [PREFIX] [SHAREDIR] [BINDIR] [LIBDIR] [MANDIR]
	PREFIX   - installation directories prefix (default: /usr/local)
	SHAREDIR - path to Mupen64Plus shared data files (default: $PREFIX/share/mupen64plus)
	BINDIR   - path to Mupen64Plus binary program files (default: $PREFIX/bin)
	LIBDIR   - path to Mupen64Plus plugin files (default: $SHAREDIR/plugins)
	MANDIR   - path to manual files (default: $PREFIX/man/man1)
```

You must pass the same options to the uninstall.sh script when uninstalling in order to remove all of the Mupen64Plus files.

You should install the Mupen64Plus plugins (libraries) in their own folder.  If you install them in a common directory such as /usr/lib and then later uninstall them with "sudo uninstall.sh LIBDIR=/usr/lib", it will delete all system libraries.

If you install with SHAREDIR in a place other than /usr/local/share/mupen64plus or /usr/share/mupen64plus, and BINDIR is not the same as SHAREDIR, then users will have to run Mupen64Plus with the --installdir= option, otherwise they will get an error.  The mupen64plus executable looks in up to 5 different directories in order to find the Shared Data Directory.  The order in which the directories are searched is:

  1. directory specified on command line with --installdir
  1. same directory as the mupen64plus binary
  1. /usr/local/share/mupen64plus
  1. /usr/share/mupen64plus
  1. current working directory

If you choose to install the plugins in a non-standard location (someplace other than $SHAREDIR/plugins), then you must set the PluginDirectory parameter in the mupen64plus.conf config file to the directory path in which the plugins have been installed.

## 4. Multi-user Support ##

As of version 1.3, Mupen64Plus now has support for multi-user environments.

The mupen64plus program will look for user configuration files in a .mupen64plus directory in the user's home directory. If the directory does not exist, it will be created and a default mupen64plus.conf file will be written to that directory. If desired, an alternate config directory can be specified using the --configdir commandline option.

By default, the mupen64plus program will look for plugins, icons, and language translation files in the install directory $PREFIX/share/mupen64plus (see Installation section for details). If this directory does not exist, mupen64plus will try to use the current working directory. An alternate installation directory can be specified using the --installdir commandline option.

Run 'mupen64plus --help' for a complete list of commandline options:
```
 $ mupen64plus --help
 Usage: mupen64plus [parameter(s)] rom

 Parameters:
         --nogui                 : do not display GUI
         --fullscreen            : turn fullscreen mode on
         --noosd                 : disable onscreen display.
         --gfx (path)            : use gfx plugin given by (path)
         --audio (path)          : use audio plugin given by (path)
         --input (path)          : use input plugin given by (path)
         --rsp (path)            : use rsp plugin given by (path)
         --emumode (number)      : set emu mode to: 0=Interpreter 1=DynaRec 2=Pure Interpreter
         --sshotdir (dir)        : set screenshot directory to (dir)
         --configdir (dir)       : force config dir (must contain mupen64plus.conf)
         --installdir (dir)      : force install dir (place to look for plugins, icons, lang, etc)
         --noask                 : dont ask to force load on bad dumps
         --testshots (list)      : take screenshots at frames given in comma-separated list, then quit
         -h, --help              : see this help message
```

## 5. Key Commands In Emulator ##

The keys or joystick/mouse inputs which will be mapped to the N64 controller for playing the games are determined by the input plugin.  The emulator core also supports several key commands, which are fixed and cannot be changed.  They are:

| **Key** | **Description** |
|:--------|:----------------|
| Escape  | Quit the emulator |
| 0-9     | Select virtual 'slot' for save/load state (F5 and F7) commands |
| F5      | Save emulator state |
| F7      | Load emulator state |
| F9      | Reset emulator  |
| F10     | slow down emulator by 5% |
| F11     | speed up emulator by 5% |
| F12     | take screenshot |
| Alt-Enter | Toggle between windowed and fullscreen |
| p or P  | Pause on/off    |
| m or M  | Mute/unmute sound |
| g or G  | Press "Game Shark" button (only if cheats are enabled) |
| / or ?  | single frame advance while paused |
| F       | Fast Forward (playback at 250% normal speed while F key is pressed) |
| [       | Decrease volume |
| ]       | Increase volume |

## 6. Default Key Mappings for SDL-Input Plugin ##

The keys or joystick/mouse inputs which will be mapped to the N64 controller for playing the games are determined by the input plugin.  The SDL-Input plugin contains an auto-configuration function which will provide default joystick mappings for any recognized joystick.  If there is no supported joystick connected, the input plugin will enable a default keyboard control mapping, as given below:

| **N64 Controller Action** | **Keys** |
|:--------------------------|:---------|
| Analog Pad                | Arrow Keys (left, right, down, up) |
| C Up/Left/Down/Right      | "I", "J", "K", "L" |
| DPad Up/Left/Down/Right   | "W", "A", "S", "D" |
| Z trigger                 | "z"      |
| Left trigger              | "x"      |
| Right trigger             | "c"      |
| Start                     | "Enter" ("Return") |
| A button                  | "left shift" |
| B button                  | "left control" |
| Select Mempack            | ","      |
| Select Rumblepack         | "."      |

## 7. Known Issues ##

As of March 2008, the RiceVideoLinux plugin causes artifacts when fog is enabled in most games with the open source drivers for ATI Radeon graphics adapters. If you are using the open source Radeon driver, you should set the "EnableFog" value in RiceVideo.cfg to 0.

When using RiceVideoLinux, there are quite a few games which show an artifact whereby some or all of the polygons on the screen will disappear every few frames, revealing the underlying background color.  This problem is usually caused by the wrong screen update setting.  If you edit the ini file at: ~/.mupen64plus/RiceVideoLinux.ini, search for the section with the game's name, and add "ScreenUpdateSetting=1" to the bottom.  This usually fixes the flashing artifacts.  Please file an issue report here with the game's name and MD5 hash value if you find a game which exhibits this problem and works correctly after the .ini file update.