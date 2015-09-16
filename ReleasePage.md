## Mupen64Plus v2.5 - April 26, 2015 ##
### All Modules ###
  * Move from bitbucket (Mercurial) to GitHub
  * Travis CI integration with GitHub for continuous automated build regression testing
  * New: MS Visual Studio 2013 project files
  * Finish integration with SDL2.0, and build against SDL2 by default
### Audio-SDL Plugin ###
  * Add audioresource support for integration with Linux-based Nemo Mobile OS
### Console-UI Front End Application ###
  * Update man page document
  * Add application desktop file and icons
  * New option: load savestate immediately on emulator startup
  * Compile-time flag to support building ui-console as a library (used by Android frontend)
### Core Emulator Library ###
  * Game-specific fixes: Banjo Tooie, Zelda Ocarina of Time, DK64, Hydro Thunder, others
  * Game-specific override for # of clock cycles per cpu instruction
  * New Dynarec: Speed improvements, accuracy fixes, build support for MSVC
  * Cheat fixes for WWF No Mercy, Bomberman Hero, Super Mario 64, and Pokemon Stadium (E)
  * Major [R4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) CPU core refactoring in many subsystems to improve code organization
  * Rewrite speed limiter code to improve performance and audio synchronization
  * Separate the logic of the Pure Interpreter from the Cached Interpreter
  * Regression test improvements
  * Support for building against OpenGL ES
  * Build system improvements for ARM / Raspberry Pi
### Input-SDL Plugin ###
  * SDL2: use SDL1.2 keysyms in the mupen64plus.cfg file Input section for consistency
  * SDL2: use prioritization to decide among multiple matching auto-config sections (for XInput)
  * New auto-config sections for: Wiimote Classic, Wii U Gamecube / Pro, MS SideWinder GamePad Pro, 17 others
  * When Mouse=True but pointer is un-grabbed, fall back to joystick settings for analog x/y
  * New feature: prevent mouse/trackpad auto-centering behavior by pressing left-Windows key
### Video-Glide64mk2 Plugin ###
  * Fix colors in compressed fxt1 textures by importing mesa code
  * Replace patented S3TC algorithm with compatible S2TC
  * Enable the dump\_cache to allow loading of dat files
  * Bugfix: work around problem in OSD callback whereby core code doesn't re-activate shader
  * Bugfix: Resident Evil II hang
  * Allow user override of game-specific settings via mupen64plus.cfg
  * New feature: option to enable full-scene antialiasing
  * Code cleanup to remove dead section of code
  * Add OpenGL ES support (2.0)
  * Add config option to force polygon offset values (fixes artifacts on certains games / renderers)
  * Fix broken C version of MulMatricesC
  * New optional frameskip feature, which drops frames instead of rendering if game is going slow
  * Fix texture pack read failure on some 64-bit platforms
  * Correct N64 ROM header analysis for PAL/NTSC detection
  * Bugfix: use memmove() instead of memcpy() for overlapping buffers
  * Win32: don't set gamma table because it breaks monitor calibration
### Video-Rice Plugin ###
  * Game-specific hack-fix to show last heart and map arrows in Zelda OoT & MM.
  * Lots of code cleanup, removal of deprecated code, and simplifications
  * Modernize OpenGL interfaces, remove code for supporting old opengl versions
  * Graphics fixes for: Fog, RDP InsertMatrix command
  * Fix for INI file loading under Windows
  * Minor OpenGL ES fixes
  * Add config option to force polygon offset values (fixes artifacts on certains games / renderers)
  * Bugfix: crash if RiceVideoLinux.ini not found
### RSP-HLE Plugin ###
  * Game-specific fixes: Bottom of the 9th, IndianaJones, BattleForNaboo, Conkers Bad Fur Day
  * Support for MusyX microcodes
  * Improve audio microcode identification
  * Huge quantity of code cleanups and refactoring to improve organization
  * Add support for additional audio commands: #16, POLEF, RESAMPLE\_ZOH
  * Multiple bugfixes in audio processing code
  * Bugfix: microcode detection could sometimes fail after reset

## Mupen64Plus v2.0 - July 4, 2013 ##
### All Modules ###
  * New: MS Visual Studio 2012 project files
  * Makefiles: support for ARM, PPC, and MINGW architectures
  * Makefiles: support for cross-compiling (MXE win32 builds under Unix)
  * Support (building from source) for new SDL 2.0 library
### Audio-SDL Plugin ###
  * Add support for resampling with speexdsp library
  * Add more resampling quality options
  * Bugfix: Don't assume OSS is installed in all linux systems.
  * Make SDL volume handling the default, since OSS is no longer included in the kernel.
  * Minor refactoring of volume handling code.
### Console-UI Front End Application ###
  * Only build system changes
### Core Emulator Library ###
  * Fixes for various games (DK64, Zelda, Blast Corps)
  * Add Ari64's dynamic recompiler for x86 (32-bit) and ARM
  * Improved PJ64 savestate loading
  * Support video window resizing (with help from video plugin and front-end application)
  * Auto-detect savestate type (Mupen64Plus or PJ64) when loading from a slot
  * Many various code cleanups in core from casualjames
  * Debugger code cleanup
### Input-SDL Plugin ###
  * Re-write auto-configuration logic to be more user friendly.  Add new 'mode' parameter.
  * Support for 6 new joysticks
  * Work-around for buggy xboxdrv which results in no rumble
  * Bugfix: crash when rumble used with controller #4
### Video-Glide64mk2 Plugin ###
  * Brand new video plugin which has been ported to Mupen64Plus
### Video-Rice Plugin ###
  * Support for resizable video window
  * Add support to build and run with OpenGL ES 2.0
  * Improve hi-resolution texture loading support
  * Fix texture CRC calculation for non-x86 (or NO\_ASM) platforms
### RSP-HLE Plugin ###
  * Add support for MusyX ucode detection
  * Support JPEG decoding used in Pokemon Stadium Japan
  * Lots of refactoring to clean up code

## Mupen64Plus v1.99.5 - March 10, 2012 ##
### Audio-SDL Plugin ###
  * added version number to SDL-audio plugin config parameters, to support future changes
  * updated audio plugin for new Mupen64plus 2.0 API versioning scheme
  * makefile fixes and improvements
### Console-UI Front End Application ###
  * New option to disable internal core speed limiter (for benchmarking)
  * Updated Console-UI front-end for new Mupen64plus 2.0 API versioning
  * Added config version number for UI-Console section
  * makefile fixes and improvements
### Core Emulator Library ###
  * New feature: support for N64 internal real-time clock
  * use X-Scale's PIF-CIC algorithm instead of the hard-coded challenge-response pairs
  * New config parameter for path to save SRAM/EEPROM/MPK files, so they can be separated from emulator snapshots
  * updated core for new Mupen64plus 2.0 API versioning scheme
  * split core configuration data into 2 sections: Core and CoreEvents. Added version numbers and upgrade handling to both
  * Accurately emulate the RSP DMA operation (from Bobby Smiles)
  * bugfix: #290 - OnScreenDisplay text is sometimes captured in screenshots
  * bugfix: when the front-end specifies an override for the configuration directory, always use this path, so that we don't load the config from there and then save it back to the default user path
  * bugfix: #468 - On-screen-display problem under OSX
  * bugfix: Use option SaveStatePath from config file
  * bugfix: don't call SDL\_Quit() until the core library is being unloaded.  fixes some front-end use cases
  * bugfix: #410 - segfault in dma\_pi\_write()-->strlen() if /home/username/.local/share/mupen64plus/ owned by root
  * bugfix: for Interpreter cores, use proper math functions for ceil/floor/round/trunc instead of x87 rounding modes
  * many makefile fixes and improvements
### Input-SDL Plugin ###
  * Improved input setup behavior (auto-config) to make some use cases more friendly
  * Updated input plugin for new Mupen64plus 2.0 API versioning scheme
  * Added version number to SDL Input plugin parameters
  * Add new parameter for mouse sensitivity, handle mouse movement differently so mouse is easier to use as controller
  * New auto-configuration for controllers:
    * raphnet technologies GC/N64 usb converter
    * Logitech Chillstream Controller
    * Jess Tech Colour Rumble
    * Xbox 360 linux userspace driver
    * Generic X-Box pad
    * Saitek P2900 Wireless Pad
    * Jess Tech USB 4-Axis 12-Button Gamepad
  * bugfix: #392 - when switching between rumble pak and memory pak, simulate removing the pack, waiting 1 second, then inserting the new one
  * bugfix: #424 - problem with USB devices supporting multiple controllers per device
  * bugfix: #409 - PS3 controller not auto-detected in Gentoo when connected via bluetooth
  * bugfix: correctly handle USB devices with multiple game pads, from Peter Helbing
  * makefile fixes and improvements
### Rice Video Plugin ###
  * Hires texture loading: support for 8-bit PNG images
  * New config option for forcing vertical sync
  * Check OpenGL attributes after creating video window and report any that failed to set
  * Updated video plugin for new Mupen64plus 2.0 API versioning scheme
  * Update to Video API version 2.1.0.
  * Bugfix: hi-res textures: Scale highres textures by precalculated scaleShift exponent
  * Bugfix: dont call CoreVideo\_Init() inside of the !InitializeGFX() function. This will fix some front-end use cases
  * Bugfix: Fix z coordinate in 3d line rendering
  * Bugfix: double infinite loop in GetValidTmemInfoIndex
  * Bugfix: Perfect Dark randomly crashes due to divide-by-zero error
  * Bugfix: crash in loading Celda 2009 hi-res texture pack for Zelda Ocarina of Time
  * makefile fixes, improvements, and code cleanups
### RSP-HLE Plugin ###
  * Handle JPEG decompression, used in Ogre Battle 64 and Pokemon Stadium
  * updated RSP plugin for new Mupen64plus 2.0 API versioning scheme
  * bugfix: #102 - Missing backgrounds in Ogre Battle 64
  * many makefile fixes and improvements


## Mupen64Plus v1.99.4 - November 22, 2010 ##
### Console-UI Front End Application ###
  * add some parameter checking for --emumode option
  * new cheat file format from spinout182
  * makefile fixes and improvements
### Core Emulator Library ###
  * Added some type checking to ConfigGetParameter() function, and a new error type
  * Bugfix: avoid segfault in the video extension code if SDL initialization fails (because video plugin fails)
  * Added new CoreGetRomSettings() function for front-ends
  * Allow to run dynarec in hardware DEP protected windows
  * Allow core .cfg parser to accept strings without quotes around them
  * API change: use new ReadScreen2() video plugin function
  * New re-entrant [R4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) disassembler, from tty68k/zzt32, a man who loves MIPS processors
  * makefile fixes and improvements, code cleanups
### Audio-SDL Plugin ###
  * Bugfix: Plugin should write default config values at startup time
  * Bugfix: fixed fast-forward for banjo-kazooie and other games which was broken due to limitation in basic resampling algorithm
  * makefile fixes and improvements
### Input-SDL Plugin ###
  * Bugfix: Do configuration during PluginStart(), so GUI will see defaults (auto-configured) the first time it is run
  * Move axis value reducers to right shift and right ctrl, to avoid conflict with A/B buttons
  * New feature: extra deadzone parameter in axis() config parameter clause when mapping an analog joystick axis to an N64 button
  * many new joystick auto-configurations
  * makefile fixes and improvements
### Rice Video Plugin ###
  * new feature: anisotropic filtering
  * new feature: trilinear filtering
  * new feature: mipmaps
  * cleaned up FindScaleFactor function based upon [r45](https://code.google.com/p/mupen64plus/source/detail?r=45) of the 1964 repo
  * bugfix: buffer overrun (and crash) when reading vendor string info on some opengl implementations
  * API change for reading the video buffer: new interface is more flexible and avoids some potential problems
  * support for anti-aliasing (GL\_MULTISAMPLE)
  * makefile fixes, improvements, and code cleanups
### RSP-HLE Plugin ###
  * merged all big-endian fixes from mupen64gc project
  * makefile fixes and improvements

## Mupen64Plus v1.99.3 - February 13, 2010 ##
### Console-UI Front End Application ###
  * New feature: command-line option --set for setting arbitrary configuration variables
  * updated MAN page for all the changes made in the 2.0 re-architecture
### Core Emulator Library ###
  * New feature: configuration function ConfigGetParameterType()
  * New feature: up to 1000 screenshots per ROM are allowed
  * New feature: support for Gameshark 3.3 patch codes
  * Bugfix: Use Dynarec by default when core supports it.  If dynarec is selected but unavailable, fall back to cached interpreter
  * Bugfix: screenshot directory handling code used unix-specific path separators; now is platform-independent
  * Bugfix: #313 - 64-bit inline assembly code in [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300)/x86\_64/rjump.c needs to have underscores before the symbols names in OSX
  * Bugfix: old bug in the core - hang if a ROM **without** a 16kb EEPROM type is loaded after a ROM **with** a 16kb EEPROM type
  * Bugfix: rumble feature caused memory corruption
  * Bugfix: Problem with zilmar API: the plugin RomOpen() functions had no way of returning errors to the core, causing crashes
  * Replaced api documentation .tar.gz file with the mediawiki text
  * Build script improvements:
    * new feature: m64p\_update.sh script can take an input argument to update to a tag or revision
    * new feature: added bash script for building source packages of individual modules
### Audio-SDL Plugin ###
  * sync with core/plugin API change for RomOpen()
  * bugfix: logical error in previous audio refactoring causing slowdown/lockup on loading savestate or re-initializing audio
### Input-SDL Plugin ###
  * New feature: auto-configuration uses an .ini file instead of hard-coding the controllers in the source code
  * New controller auto-configurations:
    * Original X-Box (and compatible clones)
    * HuiJia USB GamePad
    * USB Human(2p) Interface Device
  * sync with core/plugin API change for RomOpen()
  * Bugfix: controller pak was fixed at startup, switching b/w mempak and rumblepak did not work
  * Bugfix: Xbox 360 and PS3 controllers need slightly different names under OSX
### Rice Video Plugin ###
  * sync with core/plugin API change for RomOpen()
  * Changed default ScreenUpdateSetting to 1 for Linux, and 4 for Windows
  * use custom opengl extension function pointer typedefs, to avoid compilation errors with some drivers including hosed gl.h headers
  * merged some changes from Tillin9 commits in [r1142](https://code.google.com/p/mupen64plus/source/detail?r=1142)-rice-video-gtk-refactor branch, to be more lenient in hi-res texture loading
  * bugfix: hi-res textures did not work in Windows
  * bugfix: #329: remove some deprecated types and a function call to prevent build errors with libpng 1.4
  * bugfix: fixed mirroring bugs in Rice Video hi-resolution texture loading, based on Tillin9 rev 1337 in [r1142](https://code.google.com/p/mupen64plus/source/detail?r=1142)-rice-video-gtk-refactor branch
  * bugfix: in ConvertImage.cpp none of the 4-bit conversion functions could handle 1-pixel wide textures

## Mupen64Plus v1.99.2 - January 6, 2010 ##
### Console-UI Front End Application ###
  * new feature: added MSVC8 project/solution files, minor refactoring for VC compatibility
### Core Emulator Library ###
  * doc: added tarball of emuwiki api documentation from 2010-01-06 for backup purposes
  * clean-up: removed almost all of the ifdef WIN32 statements
  * bugfix: stop spamming console with "Core: couldn't open memory pack file '...' for reading" messages
  * bugfix: stop spamming console with "Core: couldn't open eeprom file '...' for reading" messages
  * new feature: MSVC8 project file for mupen64plus-core, refactored code for VC8 compatibility
### Audio-SDL Plugin ###
  * new feature: Completely re-wrote buffering/synchronization code:
    * Buffer parameters now work as advertised and all use the same units
    * Bugfix: previous defaults and algorithm behavior caused audio choppiness on slower PCs
    * Bugfix: maximum speed was previously limited to low value by constraints from primary buffer size
  * bugfix: SDL volume control will always be used on systems without OSS support
  * new feature: added MSVC8 project file, minor code refactoring to build in Windows
### Input-SDL Plugin ###
  * new feature: added MSVC8 project file, minor code refactoring for VC compatibility
  * added auto-configuration for:
    * Xbox 360 Wireless Receiver
    * PS3 controller
    * Jess Tech Dual Analog Pad
### RSP-HLE Plugin ###
  * New feature: added MSVC8 project file for RSP-HLE plugin, fixed a few minor incompatibilities
### Rice Video Plugin ###
  * bugfix: fix fragment program combiner for Intel drivers in Win32, by ensuring that program does not allocate unused temp vars or call TEX commands for texture units that are not enabled
  * new feature: compile-time option for opengl debugging by calling glGetError after each opengl command (except inside of glBegin/glEnd)
  * portability: use ALIGN() for aligned data member declarations in header files as well as the definitions in CPP files
  * portability: refactor opengl code to use `VidExt_GL_GetProc()` for all opengl functions newer than v1.1, so that this will work in Windows
  * portability: Abstracted directory-handling code with new `osal_files` source code
  * portability: replaced unix `gettimeofday()` function calls with `SDL_GetTicks()`
  * new feature: added MSVC8 project file, fixed minor incompatibilities with VC compiler

## Mupen64Plus v1.99.1 - December 14, 2009 ##
### Console-UI Front End Application ###
  * Brand new Console-based front-end for Mupen64Plus 2.0
  * New feature: [R4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) Core Comparison for debugging
  * New feature: Cheat code support from command-line
### Core Emulator Library ###
New 2.0 architecture advantages:
  * Simplified emulator Core, making it much more portable
  * Removed all GUI code from plugins, making them simpler and more portable
  * User interface development is not tied to Core emulator releases
  * All messages from core/plugins can be filtered and shown in GUI instead of only on console
  * Video Extension allows Front-end to override some video functions, ie to support embedded render window
  * Startup in Fullscreen mode, instead of always starting in windowed mode and switching to FS after few seconds
  * video resolution can be given via command-line parameter
  * all configuration options for core and plugins are in a single config file, can be configured with a single GUI
  * dummy plugins are automatically used if plugin loading fails for any reason
  * core and plugins all use the same conventions for where to put data/config files
Mupen64Plus core:
  * New feature: cheat code support
  * New feature: Keyboard shortcuts for Core commands are now user-configurable
  * New feature: can load/save PJ64 state files
  * Major code cleanup, refactored build system to separate source and object files
  * Removed many dependencies to simplify porting to other platforms
  * Moved all of the SDL event-related stuff into a new source file eventloop.c
  * Use XDG directory convention for file locations on Unix
  * bugfix: frame advance feature should advance every frame, instead of every vertical interrupt (every field)
  * bugfix: allow diagonal hat movements for core joystick commands
  * bugfix: modified SDL event loop joystick code so that gameshark button press is captured, and joystick commands that are level-triggered instead of edge-triggered (such as fast foward) can be accommodated
  * bugfix: fixed the outstanding SDL event issues by re-writing the code which handles the joystick-event-driven core commands.  Now the axis-based commands use hysteresis and there is a single global event function for determining if the gameshark button is pressed
  * bugfix: OSD crash after pause-stop-start-pause of emulator
  * bugfix: Set video width and status, aiDacrate during savestate load
  * bugfix: in pure interpreter, Dont allow to override [r0](https://code.google.com/p/mupen64plus/source/detail?r=0) register
  * bugfix #52: PJ64 load state patch from olejl77
  * bugfix #268: use aligned malloc and mprotect to set executable status for dynarec emitted code
  * bugfix #51: Floating Point Register data was not correctly converted when switching between 32-bit (MIPS-I) mode and 64-bit (MIPS III). New code more closely emulates behavior of [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) hardware.  Fixes collision problems in Banjo-Tooie
  * bugfix #272: rounding mode for x86 FPU not being set correctly in interpreter and pure interpreter cores
  * bugfix: many games need different ScreenUpdateSetting to work properly with Rice Video
### Audio-SDL Plugin ###
  * Converted to new Mupen64Plus 2.0 API
  * Code cleanup to remove non-standard data types
  * Refactored build system to separate source and object files
  * bugfix #269: jttl\_audio segfaults on exit due to incorrectly ordered shutdown code
### Input-SDL Plugin ###
  * New feature: Joystick/Keyboard auto-configuration
  * New feature: deadzone and peak analog joystick values are now configurable
  * Converted to new Mupen64Plus 2.0 API
  * Refactored build system to separate source and object files
  * Major code cleanup: mouse movement and analog axis code was terrible, removed non-standard data types
  * Improved debug messages
  * bugfix: mapping the X/Y analog sticks to keypresses didnt work
  * bugfix: LeftCtrl-LeftAlt key command when mouse is enabled to now toggles between grabbing and releasing the mouse pointer
### RSP-HLE Plugin ###
  * Converted to new Mupen64Plus 2.0 API
  * Refactored build system to separate source and object files
  * Refactored all code to remove win32-specific things, unnecessary functions, and clean up
### Rice Video Plugin ###
  * Converted to new Mupen64Plus 2.0 API
  * Major code cleanup, removed all non-standard data types
  * Refactored build system to separate source and object files
  * added NO\_ASM build option
  * removed some unused configuration parameters
  * bugfix: handle fullscreen video mode properly: start up in this mode instead of always starting in windowed and needing the core to switch to fullscreen
  * bugfix #209: setjmp/longjmp fixes in the BMP writer and PNG reader
  * bugfix: eliminated duplicate 'Found ROM ...' messages


## Mupen64Plus v1.5 - January 4th, 2009 ##
### Major New Features ###
  * Support for Macintosh OSX platform with Intel CPUs
  * Qt4 GUI by slougi, Tillin9, and others
  * Rom Cache System ([r636](https://code.google.com/p/mupen64plus/source/detail?r=636), others), by Tillin9, Okaygo, and Hasone.
### Minor New Features ###
  * [r1235](https://code.google.com/p/mupen64plus/source/detail?r=1235): Debugger: memory breakpoint speedup
  * [r1170](https://code.google.com/p/mupen64plus/source/detail?r=1170)-1178,1181: QT GUI: translations for English, Norwegian, German, and Dutch
  * [r1155](https://code.google.com/p/mupen64plus/source/detail?r=1155): Use configurable key commands for special emulator functions
  * [r1134](https://code.google.com/p/mupen64plus/source/detail?r=1134): got our own custom test ROM, courtesy of Marshallh
  * [r1046](https://code.google.com/p/mupen64plus/source/detail?r=1046): debugger: new [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) disassembler from ZZT32
  * [r829](https://code.google.com/p/mupen64plus/source/detail?r=829): jttl\_audio: added GTK GUI configuration dialog
  * [r793](https://code.google.com/p/mupen64plus/source/detail?r=793): soft reset (hit F9)
  * [r782](https://code.google.com/p/mupen64plus/source/detail?r=782): jttl\_audio: both SDL-based and OSS-based volume control methods are now supported
  * [r765](https://code.google.com/p/mupen64plus/source/detail?r=765): added savestate conversion tool to be able to load pre-v1.5 savestate files
  * [r711](https://code.google.com/p/mupen64plus/source/detail?r=711): 7-zip support
  * [r692](https://code.google.com/p/mupen64plus/source/detail?r=692): Multi-file Zip support
  * [r667](https://code.google.com/p/mupen64plus/source/detail?r=667): GTK GUI: user-configurable columns in ROM browser
  * [r659](https://code.google.com/p/mupen64plus/source/detail?r=659): LZMA archive support
  * [r638](https://code.google.com/p/mupen64plus/source/detail?r=638): BZip2 archive support
  * [r629](https://code.google.com/p/mupen64plus/source/detail?r=629),634: LIRC - added support for speedup, slowdown, pause, and frame advance
### Updates ###
  * [r1007](https://code.google.com/p/mupen64plus/source/detail?r=1007),1032: GTK GUI improvements
  * [r970](https://code.google.com/p/mupen64plus/source/detail?r=970), 1019: use SDL threading support instead of pthreads
  * [r935](https://code.google.com/p/mupen64plus/source/detail?r=935),938,940: Gtk GUI updates for core and Jttl
  * [r642](https://code.google.com/p/mupen64plus/source/detail?r=642),655-657,663,664,747,759,761-763,768-770,774,775,780,781,783,786,787,825,828,931: mupen64plus.ini updates: Good Names, stars, EEPROM types, players, rumble support
### Bugfixes ###
  * [r1247](https://code.google.com/p/mupen64plus/source/detail?r=1247): rsp\_hle: memory overwrite bug with Zelda:OOT
  * [r1234](https://code.google.com/p/mupen64plus/source/detail?r=1234): out of bound array bug in memory access function handlers
  * [r1222](https://code.google.com/p/mupen64plus/source/detail?r=1222),1223,1228,1229: Debugger fixes
  * [r1183](https://code.google.com/p/mupen64plus/source/detail?r=1183): Blight Input: sometimes the axis direction would flip
  * [r1133](https://code.google.com/p/mupen64plus/source/detail?r=1133): Added stop rumble to load savestate, fixes [issue 165](https://code.google.com/p/mupen64plus/issues/detail?id=165)
  * [r1077](https://code.google.com/p/mupen64plus/source/detail?r=1077): GTK GUI bugfixes
  * [r1063](https://code.google.com/p/mupen64plus/source/detail?r=1063): rice video: crash in MMX/SSE checking functions
  * [r800](https://code.google.com/p/mupen64plus/source/detail?r=800): logical error in strcpy loop in util.c
  * [r798](https://code.google.com/p/mupen64plus/source/detail?r=798): small bugfixes in blight\_input: 1. only save config file after running config dialog, not every time DLL is closed.  2. If rumble is not available on a controller, don't allow user to switch between rumble and mempack.  3. If rumble is selected in config file but not available on a controller, select mempack instead.
  * [r789](https://code.google.com/p/mupen64plus/source/detail?r=789): 3 glN64 bugfixes (segfaults on a 64-bit system in Perfect Dark): prevent clamp values from being negative, handle TMEM wrap-arounds from wacky height/line values in texture cache load and texture CRC functions
  * [r788](https://code.google.com/p/mupen64plus/source/detail?r=788): rice video: add checks for uint32 height/width parameters which can be negative, causing segfault on 64-bit systems
  * [r784](https://code.google.com/p/mupen64plus/source/detail?r=784): 64-bit problem causing GUI crashes - gotta save/restore all the callee-saved registers around the dynarec
  * [r758](https://code.google.com/p/mupen64plus/source/detail?r=758): fixed some savestate problems
  * [r748](https://code.google.com/p/mupen64plus/source/detail?r=748): Fixed 64-bit dynarec crash in genj\_idle() and genjal\_idle()
  * [r715](https://code.google.com/p/mupen64plus/source/detail?r=715): Bugfixes thanks to Valgrind. Two using strcpy with source and destination overlay, i.e. strcpy(p,p+1)
  * [r700](https://code.google.com/p/mupen64plus/source/detail?r=700): set ScreenUpdateSetting=1 in rice video ini file for Conkers BFD
  * [r694](https://code.google.com/p/mupen64plus/source/detail?r=694): require bash shell scripting for install.sh
  * [r686](https://code.google.com/p/mupen64plus/source/detail?r=686): fixed OSD crash bug after running a game, disabling OSD, then running another game
  * [r684](https://code.google.com/p/mupen64plus/source/detail?r=684): OGLFT measuring functions were taking a huge chunk of CPU time.  Refactored code to measure only once and store the line size and the message sizes instead of re-measuring all the time.  This eliminated nearly all of the OSD overhead on my PC
  * [r681](https://code.google.com/p/mupen64plus/source/detail?r=681): Refactored OGLFT to do color setting outside of glyph compiling, so the OSD fading doesnt force bitmaps to be continually recreated with calls to renderGlyph.  Seems to have cut the excessive cpu usage of the OSD about by half
  * [r680](https://code.google.com/p/mupen64plus/source/detail?r=680): removed many unused classes from OGLFT font library code
  * [r676](https://code.google.com/p/mupen64plus/source/detail?r=676): bugfix in my BYTESWAP macros
  * [r674](https://code.google.com/p/mupen64plus/source/detail?r=674): Removed glide64/Tmem\_nasm.asm source file and the project dependency on nasm/yasm assemblers
  * [r673](https://code.google.com/p/mupen64plus/source/detail?r=673): removed inline assembly sections in rdp\_loadblock and rdp\_loadtile, including their dependency on functions in Tmem\_nasm.asm.  Replaced with new C code.  This fixes a segfault on some 64-bit source builds
  * [r669](https://code.google.com/p/mupen64plus/source/detail?r=669): string function causing crash on 64-bit linux
  * [r667](https://code.google.com/p/mupen64plus/source/detail?r=667): [issue #88](https://code.google.com/p/mupen64plus/issues/detail?id=#88) - added basic view menu in GTK GUI
  * [r628](https://code.google.com/p/mupen64plus/source/detail?r=628),633: Small patch to get glide64.so to compile with O3 optimizations
  * [r622](https://code.google.com/p/mupen64plus/source/detail?r=622): Fixed segfault in Glide64 as per [issue 113](https://code.google.com/p/mupen64plus/issues/detail?id=113)
  * [r619](https://code.google.com/p/mupen64plus/source/detail?r=619): fix LIRC build to integrate w/ new screenshot mechanism
  * [r608](https://code.google.com/p/mupen64plus/source/detail?r=608): another couple of memory leak fixes from Tub, in main/config.c
  * [r605](https://code.google.com/p/mupen64plus/source/detail?r=605): fix from Tub for free() bug in main/util.c/list\_delete()
  * [r587](https://code.google.com/p/mupen64plus/source/detail?r=587): [issue #111](https://code.google.com/p/mupen64plus/issues/detail?id=#111): close screenshot file after saving

## Mupen64Plus v1.4 - June 14, 2008 ##
  * New feature: graphical debugger for [R4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) core
  * New feature: On Screen Display
  * New feature: KDE4 GUI (experimental)
  * New feature: cheat system with Gameshark codes
  * New feature: search/filter box in GTK GUI
  * New feature: single frame advance
  * New feature: adjust emulator playback speed up or down in 5% increments
  * New feature: Rumble Pak support with force feedback
  * New feature: Map emulator functions (fullscreen, stop emulation, etc) to joystick buttons or axis movements.
  * New feature: Volume up/down
  * Blight Input: Individually configure each direction of X and Y axis, which allows inverting the axis
  * JTTL\_Audio: libsamplerate support for high quality audio resampling
  * GTK GUI: Removed second status bar which was not used
  * GTK GUI: Implemented accelerator keys
  * GTK GUI: Replaced custom directory browser with GTK file chooser
  * GTK GUI: numerous small changes and fixes
  * Added Mupen64Plus 'man' (manual) page
  * Removed mupen64\_audio plugin, as it was unnecessary and mostly broken
  * Added NoMemoryExpansion parameter to emulate 4MB console; fixes some games
  * Overhaul of rom handling functions; numerous small fixes
  * Bugfix: Removed NoAudioDelay core option to resolve [issue #48](https://code.google.com/p/mupen64plus/issues/detail?id=#48)
  * Bugfix: check for stopped state in dynarec jump function, to fix unresponsive emulator when game gets stuck in loop
  * Bugfix: GTK GUI: #6 - if a ROM is selected in the ROM browser and 'play' is pressed, emulation will start
  * Bugfix: GTK GUI: #62 - ROM browser column sorting works
  * Bugfix: Rice Video: Support hi-res textures with different scale factors for X and Y
  * Bugfix: Blight Input: don't use 100% CPU in configuration dialog


---


## Mupen64Plus v1.3 - March 29th, 2008 ##
  * New feature: Glide64 video plugin for 32-bit and 64-bit, renamed project Mupen64Plus
  * New feature: Combine mupen64 and mupen64\_nogui into a single binary
  * New feature: ability to change icon size
  * New feature: support different directories for install (plugins, icons, etc) and config (save games, config files)
  * New feature: support for creating/using ~/.mupen64plus dir for storing user data
  * New feature: support for installation via "make install" or "./install.sh"
  * New feature: support for plugins given via command line option in GUI mode
  * New feature: config dialog checkbox to toggle "noask" setting
  * New feauter: pause/continue functionality with LIRC
  * Removed messagebox utility and replaced it with cleaner alert\_message/confirm\_message calls
  * GTK GUI: Set parent window for all popups so WM will center popup windows over the main gui window
  * Added README file with information about usage of Mupen64Plus and plugins
  * Removed mupen64\_soft\_gfx, as it didn't work
  * Removed Win32 code from RSP HLE plugin,
  * Change fullscreen hotkey to Alt+Enter
  * Only plugin filenames (not paths) are stored in the mupen64plus.conf file
  * Modified pre.mk and glide64 makefile to auto-select yasm or nasm
  * Bugfix: Rice Video: Make configuration during gameplay possible again
  * Bugfix: many compiler warnings and errors in Glide64
  * Bugfix: segfault in Goldeneye and Perfect Dark for 64-bit dynarec
  * Bugfix: 64-bit dynarec bug in genld()
  * Bugfix: buffer overflow allocating temp strings for basename/dirname
  * Bugfix: GTK GUI: Exiting via File -> Exit wasn't writing out config file to disk
  * Bugfix: GTK GUI: "About" menu does not pop up while emulation is running
  * Bugfix: Glide64: Refactored a bunch of inline asm code with potential bugs
  * Bugfix: Added plugin error checking before emulator is started
  * Bugfix: Logo not loading in "about" window
  * Bugfix: Segfault in plugin\_scan\_directory()
  * Bugfix: ROM pause/continue while playing
  * Bugfix: Too many dialog windows when loading a bad dump or hacked rom
  * Bugfix: Closing emulation window now stops emulator
  * Bugfix: Rice Video: config dialog bug, now it displays proper resolution
  * Bugfix: GTK GUI: "Toolbar Style" now works
  * Bugfix: Glide64: changed inline asm label syntax, for compatibility with gcc 4.3.0
  * Bugfix: Many other minor bug fixes, GTK warnings fixes, translation corrections, etc


---


## Mupen64-amd64 v1.2 - February 10th, 2008 ##
  * New feature: Dynamic Recompiler for 64-bit
  * New feature: New ROM Browser for Mupen64 GUI build
  * New feature: LIRC remote control integration for NOGUI build
  * Added [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) instruction counting capability to 64-bit Dynarec
  * Added [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) profile data output for 32-bit and 64-bit dynamic recompilers
  * TLB Optimization / bugfix
  * Revised makefiles to support PPC builds
  * Bugfix: memory leaks in mupenIniApi.c
  * Bugfix: corrupted filenames being saved to disk for mupen64.ini
  * Bugfix: crash in jttl\_audio
  * Bugfix: crash when running game from gui after first time
  * Bugfix: spurious noise blip when running game from gui after first time


---


## Mupen64-amd64 v1.1 - December 9th, 2007 ##
  * New icons for GTK GUI
  * Removed GTK 1.2 GUI build; GTK 2.0 is required now
  * Added file pointer checking for frwite() calls and error logging
  * Added scrolling to the the rom list widget
  * Added main/version.h file to store Mupen64-amd64 package version
  * Print joystick numbers along with names in blight input to tell multiple devices apart
  * Merged okaygo's TLB hack for Goldeneye from Mupen64++
  * Rework GTK GUI config dialog; fixed bugs in ROM directory list
  * Bugfix: segfault from playing same game twice in a row from GUI
  * Bugfix: segfault from fwrite() failure in dma\_pi\_read in memory/dma.c
  * Bugfix: exit properly instead of segfault after dyna\_stop is called
  * Bugfix: blight input: `SDL_PumpEvents` must be called from thread which initialized SDL video mode
  * Bugfix: blight\_input: joystick handling caused glitch in config dialog
  * Bugfix: makefile: 32-bit CFLAGS must be used when doing 32-bit build on 64-bit machine
  * Bugfix: Added makefile to root folder for building releases


---


## Mupen64-amd64 v1.0 - November 12th, 2007 ##
  * Forked from Mupen64 v0.5
  * Ported to 64-bit architecture by NMN/SirRichard42
  * Fixed texture cache problem in glN64
  * Print more information during plugin loading process
  * Added blight input config file for logitech dual-action style controllers
  * Added SDL\_GL\_SWAP\_CONTROL attribute in glN64 to prevent tearing
  * Changed glVoids to voids due to strange compilation bug that occurs on certain systems
  * Totally refactored makefiles; now plugins are built as sub-modules
  * Better logging for [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) core selection, disallow Dynamic Recompilation for 64-bit builds at compile time
  * Set execstack attribute for all mupen64 binaries, to prevent segfault when Dynamic Recompilation is used
  * Lots of code cleanup
  * Removed 'multi-user' mode of operation
  * Removed 'configure' script and config.h file
  * Refactored plugin loading code in **nogui** build, much more user-friendly now
  * Added comments and SDL shutdown code to main.c
  * Bugfix: fixed memory leaks in plugin.c
  * Bugfix: strcpy in main/gui\_gtk/config.c should not copy overlapping strings
  * Bugfix: blight audio: only close down audio and timer sub-systems when exiting