# Where the heck are the files? #

Due to the flexibility of Mupen64Plus and its cross-platform design, they could be just about anywhere!  The quick-reference tables below gives the most likely locations for some common files. The remainder this wiki page gives the full details of where they could be.

### Linux/OSX ###
| **File Type** | **Path** |
|:--------------|:---------|
| Config file   | `~/.config/mupen64plus/` |
| Screenshots   | `~/.local/share/mupen64plus/screenshot/` |
| Save states   | `~/.local/share/mupen64plus/save/` |

### Windows XP and Earlier ###
| **File Type** | **Path** |
|:--------------|:---------|
| Config file   | `C:\Documents and Settings\your_user_name\Application Data\Mupen64Plus\` |
| Screenshots   | `C:\Documents and Settings\your_user_name\Application Data\Mupen64Plus\screenshot\` |
| Save states   | `C:\Documents and Settings\your_user_name\Application Data\Mupen64Plus\save\` |

### Windows Vista and Newer ###

| **File Type** | **Path** |
|:--------------|:---------|
| Config file   | `C:\Users\your_user_name\AppData\Roaming\Mupen64Plus\` |
| Screenshots   | `C:\Users\your_user_name\AppData\Roaming\Mupen64Plus\screenshot\` |
| Save states   | `C:\Users\your_user_name\AppData\Roaming\Mupen64Plus\save\` |

## Front-End Specific Files ##

The front-end User Interface is responsible for finding the core libraries and plugins for startup.  Each front-end may have its own method for finding these libraries.  The Mupen64Plus-UI-Console front-end looks for these libraries in the following places, in order:

### Core Library ###
  1. Path given by `--corelib` option
  1. Path given at compile time with `COREDIR` macro
  1. No path at all (allows the Operating System to search for the shared library)
  1. Current directory

### Plugin Libraries ###
The Mupen64Plus-UI-Console front-end looks through several directories in search of valid Mupen64Plus plugins.  When it finds a directory containing plugins, it populates a list with all of the plugins found.  Then, when loading plugins it only uses plugins from this list (found in one directory), unless the user specifies full plugin paths on the command line with the `--gfx`, `--audio`, `--rsp`, or `--input` options.  The order in which directories are searched is:

  1. Path given by `--plugindir` option
  1. Path given by **PluginDir** parameter in Mupen64Plus config file
  1. (Unix-only) Path given at compile-time with `PLUGINDIR` macro
  1. (Unix-only) `/usr/local/lib/mupen64plus`
  1. (Unix-only) `/usr/lib/mupen64plus`
  1. Current Directory

## Core-specific Files ##

These are files which are read and written by the core emulator.

### Screenshots ###
  1. Path given by `--sshotdir` option (if using Mupen64Plus-UI-Console)
  1. Path given by **ScreenshotPath** parameter in Mupen64Plus config file
  1. _User\_Data_/screenshot/ (see OS-specific sections below)

### Save states ###
  1. _User\_Data_/save/ (see OS-specific sections below)

## Unix-specific Search Paths ##

The _Shared\_Data_ search paths work in the following way: each time a shared data file needs is requested (such as an .ini file, or font file), the emulator core looks through all of the _Shared\_Data_ paths in order to find the file.

_Shared\_Data_:
  1. Path given by `--datadir` option (if using Mupen64Plus-UI-Console)
  1. Path given by **SharedDataPath** parameter in Mupen64Plus config file
  1. Path given at compile-time with `SHAREDIR` macro
  1. `/usr/local/share/mupen64plus`
  1. `/usr/share/mupen64plus`
  1. `./`

The _User\_Data_ and _User\_Config_ search paths work in the following way: at startup time, the emulator core looks through the list of directories to find one that exists.  The first one found is used to read/write all _User\_Data_ or _User\_Config_ files, or if none exists, then the last one in the list is created.

_User\_Data_:
  1. `$XDG_DATA_HOME/mupen64plus/`
  1. `$HOME/.local/share/mupen64plus/`

_User\_Config_:
  1. Path given by `--configdir` option (if using Mupen64Plus-UI-Console)
  1. `$XDG_CONFIG_HOME/mupen64plus/`
  1. `$HOME/.config/mupen64plus/`

## Windows-specific Search Paths ##

The _Shared\_Data_ search paths work in the following way: each time a shared data file needs is requested (such as an .ini file, or font file), the emulator core looks through all of the _Shared\_Data_ paths in order to find the file.

On Windows versions prior to Vista, the `$CSIDL_APPDATA` path is usually: `C:\Documents and Settings\your_user_name\Application Data`.  On later versions of Windows, this path is usually: `C:\Users\your_user_name\AppData\Roaming`.

_Shared\_Data_:
  1. Path given by `--datadir` option (if using Mupen64Plus-UI-Console)
  1. Path given by **SharedDataPath** parameter in Mupen64Plus config file
  1. `$CSIDL_APPDATA\Mupen64Plus\`

On Windows, the _User\_Data_ and _User\_Config_ directories are the same.  These search paths work in the following way: at startup time, the emulator core looks through the list of directories to find one that exists.  The first one found is used to read/write all _User\_Data_ or _User\_Config_ files, or if none exists, then the last one in the list is created.

_User\_Data_:<br>
<i>User_Config</i>:<br>
<ol><li>Path given by <code>--configdir</code> option (if using Mupen64Plus-UI-Console)<br>
</li><li><code>$CSIDL_APPDATA\Mupen64Plus\</code>