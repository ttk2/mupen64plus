This page has been created to list all of the third-party plugins and front-end applications for mupen64plus, in order to facilitate research. It's aim is to be a central place to find the different available plugins.

If you have made a plugin for mupen64plus which is not in this section, please contact dorian.fevrier with a link of the web site, so that it may be added to this list.

# Official Plugins #

Mupen64Plus has 5 of its own official plugins: mupen64plus-input-sdl, mupen64plus-audio-sdl, mupen64plus-rsp-hle, mupen64plus-video-rice, and mupen64plus-video-glide64mk2. If you have a problem with one of them, you should report it via [the issues list](http://code.google.com/p/mupen64plus/issues/list).

# Third-Party Front-end and Launcher Applications #

Front-ends are applications which use the Mupen64Plus core emulator and compatible plugins, and present a user-interface.  The only front-end included with the core Mupen64Plus bundle is a command-line only program.  Third-party front-ends are developed and maintained outside of the main Mupen64Plus project but are compatible with Mupen64Plus 2.0.  They are supported **by their authors**. If you have a problem with one of them, the best thing to do is to contact directly the author, who is the best placed person to answer you.

## Front-End Applications under active development ##
| **Application Name** | **Description** |
|:---------------------|:----------------|
| [m64py](http://m64py.sourceforge.net/) | Python-based GUI Front-end using PyQt |
| [OpenEmu](http://openemu.org/) | OSX application which includes many different emulators. ([Development Site](https://github.com/OpenEmu/OpenEmu)) |

## Front-end Applications not under active development ##
| **Application Name** | **Description** |
|:---------------------|:----------------|
| [winmupen](http://www.mudlord.info/emulators/) | Windows-specific GUI Front-end |
| [wxMupen64Plus](http://bitbucket.org/auria/wxmupen64plus/wiki/Home) | A frontend with full support for configuration (mostly tested on OSX at this point) |
| [Gtk64](http://www.emutalk.net/showthread.php?t=50438) | GUI Front-end based on the object oriented GTKmm library |
| [CuteMupen](http://sourceforge.net/userapps/mediawiki/vknecht/index.php?title=CuteMupen) | GUI front-end using Qt |

## Launchers ##
The difference between a full Front-End application and a Launcher application is that a Front-End application links directly with the Mupen64Plus libraries and can integrate very closely with the emulator to provide features like GUI emulator controls, an integrated video window, and graphical debugger.  A Launcher application does not link directly with the Mupen64Plus libraries, but uses the "mupen64plus-ui-console" command-line application to run the emulator.  This type of application is easier to develop, but cannot provide the more advanced features.

| **Name** | **Description** |
|:---------|:----------------|
| [Mupen64Plus-Qt](http://www.emutalk.net/threads/54976-Mupen64Plus-Qt) | Cross-platform launcher based on CEN64-Qt |
| [MupenLaunch](http://sjtrny.com/mupenlaunch/) | Nice-looking Mac OSX Launcher written in Objective C |
| [Mupen64Loader.bat](http://mupen64plus.googlecode.com/svn/wiki/Mupen64Loader.bat) | Windows batch file (tested on XP) from Supernatendo on 2010-05-11. This script simplifies the use of the Mupen64Plus console UI for Windows XP users. |
| [SpeedofMac MP64+ GUI](http://speedofmac.com/speedofmac_mp64+_launcher.html) | Launcher application for Mac OSX written with AppleScript and Perl |
| [MupenGUI C#](http://forums.ngemu.com/emulation-news-submissions/131998-new-mupen64plus-v1-99-3-release-february-2010-windows-also.html#post1803213) | Windows-only launcher/config application |

# Third-Party Plugins #

Third party plugins are plugins which are not part of the main bundle you can find here. The only way to use these are to download (and sometimes compile) them yourself.

They are supported **by their authors**. If you have a problem with one of them, the best thing to do is to contact directly the author, who is the best placed person to answer you.

| **Plugin Name** | **Description** |
|:----------------|:----------------|
| [mupen64plus-video-arachnoid](https://github.com/mupen64plus/mupen64plus-video-arachnoid/) | Video plugin for Mupen64Plus v2.0, based on the Arachnoid plugin for Project64. |
| [mupen64plus-rsp-z64](https://github.com/mupen64plus/mupen64plus-rsp-z64/) | Low-level RSP processor plugin for the Mupen64Plus v2.0 project. This is based on Ziggy's Z64 plugin. |
| [mupen64plus-video-z64](https://github.com/mupen64plus/mupen64plus-video-z64/) | Low-level RDP plugin for the Mupen64Plus v2.0 project. This is based on Ziggy's Z64 plugin. |
| [mupen64plus-video-glide64](https://github.com/mupen64plus/mupen64plus-video-glide64/) | Video plugin for Mupen64Plus v2.0, based on the Glide64 plugin from Mupen64Plus 1.5. |
| [mupen64plus-rsp-cxd4](https://github.com/mupen64plus/mupen64plus-rsp-cxd4/) | Low-level RSP processor plugin for the Mupen64Plus v2.0 project. This is based on Iconoclast/Batcat/cxd4s's rsp plugin. |