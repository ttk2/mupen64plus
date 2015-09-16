# Introduction #

Mupen64Plus includes support for [Linux Infrared Remote Control](http://www.lirc.org) (LIRC). This can be used to send commands to Mupen64Plus using a remote control.


# Building with LIRC support #

To build Mupen64Plus with LIRC support, download and unzip the source code, and pass "LIRC=1" to make. See the [README](README.md) for full details on build/installation of Mupen64Plus.

```
 $ make LIRC=1 all
```

# Configuring LIRC Commands #

LIRC uses a config file to define mappings between buttons on your remote control (as defined in lircd.conf) and the commands you want to send to Mupen64Plus. Mupen64Plus expects the LIRC config to be in a file called .lircrc in the user's home directory.

The LIRC config file contains a block for each button mapping. Here is an example block:

```
begin
   prog = mupen64plus
   button = Back/Exit
   config = quit
end
```

This maps the "Back/Exit" button on the remote control to the "quit" mupen64plus command.

You can also use the "repeat" keyword to have LIRC repeatedly send a command while you're holding down a button on the remote control. Here is an example block:

```
begin
   prog = mupen64plus
   button = Vol+
   repeat = 1
   config = vol+
end
```

This maps the "Vol+" button on the remote control to the "vol+" mupen64plus command. The repeat line means that LIRC will repeatedly send the "vol+" command as long as the remote control button is held down. Increasing the repeat number decreases how often the command will be sent to mupen64plus.

## Supported Commands ##

The following table lists the Mupen64Plus commands that can be mapped to remote control buttons in your LIRC config file:

| **Config String** | **Description** |
|:------------------|:----------------|
| 0-9               | Set current statesave slot to given slot number. |
| save              | Save game state to currently selected statesave slot. |
| load              | Load game statesave from currently selected statesave slot. |
| pause             | Pause/continue emulation. |
| quit              | Stop Emulation. |
| fullscreen        | Toggle fullscreen mode. |
| screenshot        | Take a screenshot. |
| vol+              | Increase volume by 2%. **Note:** svn only, not available in v1.3 |
| vol-              | Decrease volume by 2% **Note:** svn only, not available in v1.3 |
| mute              | Mute/unmute volume **Note:** svn only, not available in v1.3 |