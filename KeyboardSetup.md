## 1. Default Key Commands In Emulator Core ##

The emulator core supports key commands for many functions.  The default key bindings are given below, but may be changed by editing the configuration file as described later in this document.

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

## 2. Default Key Mappings for SDL-Input Plugin ##

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

![http://mupen64plus.googlecode.com/svn/wiki/keyboardMupen64Plus.png](http://mupen64plus.googlecode.com/svn/wiki/keyboardMupen64Plus.png)

When using the keyboard, the analog stick is normally moved by its full range when you press an arrow key.  Sometimes you may need to make smaller moves.  In this case, you can move the analog stick more gently by holding down the Right Control key (for -50%) or Right Shift key (-25%), or both (-75%).

## 3. Configuration for Key Commands ##

You may set your own key bindings for the emulator core and input plugins, by editing the Mupen64Plus config file.  On Linux or OSX, this is located at `~/.config/mupen64plus/`, and on Windows it is in the "Application Data" sub-folder of your user folder.  On Windows XP and prior, this is `C:\Documents and Settings\username\Application Data\Mupen64Plus\`, while on Windows Visa and newer this is `C:\Users\username\AppData\Mupen64Plus`.

See http://www.libsdl.org/release/SDL-1.2.15/include/SDL_keysym.h for Key IDs.

For documentation about the keyboard settings in this configuration file, refer to our Emuwiki site.  The [Core Parameters](https://github.com/mupen64plus/mupen64plus-core/wiki/Mupen64Plus-Core-Parameters) page gives the names of the config parameters to set up the Emulator Core key commands, while the [Plugin Parameters](https://github.com/mupen64plus/mupen64plus-core/wiki/Mupen64Plus-Plugin-Parameters#wiki-InputSDL) page tells how to configure the controls for the input plugin.