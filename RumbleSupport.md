# Introduction #

The first official Mupen64Plus release which includes support for the Rumble Pak feature is v1.4.  This feature has been tested and is known to work with Logitech Rumble Pad 2 wireless controllers.

# Prerequisites #

In order to use the Rumble Pak feature in Mupen64Plus, you must have the HID Force Feedback module enabled in your kernel, and you must have the proper HID force feedback driver for your gamepad also enabled in your kernel.  The easiest way to test your system for compatibility is to run the emulator from a console and launch a game to get diagnostic messages from the emulator.  Look in the printed information for this line:

`[blight's SDL input plugin]: version 0.0.10 initialized.`

Just prior to this line, there should be some messages regarding the rumble pak feature.  The meanings of the various messages are given below:

  * `[blight's SDL input plugin]: Couldn't find input event for rumble support.`

This suggests that your kernel does not have the required support for the rumble feature

  * `[blight's SDL input plugin]: Couldn't open device file '/dev/input/eventX' for rumble support.` (X is a number)

This is usually caused by restrictive permissions.  It is easy to set the correct permissions on this device file.  You can do this by entering "sudo chmod 666 /dev/input/eventX" where X is the number given in the error message.

  * `[blight's SDL input plugin]: Linux kernel communication failed for force feedback (rumble)`

This error message can occur when your kernel does not have support for HID Force Feedback built into it or as a module.  You must rebuild your kernel to include support for both HID force feedback and the correct driver for your gamepad.

  * `[blight's SDL input plugin]: No rumble supported on N64 joystick #1`

This could be caused by lack of kernel support or by using a joystick which does not support force feedback

  * `[blight's SDL input plugin]: Rumble activated on N64 joystick #1`

Rumble is working and enabled

# Configuration #

The Blight Input configuration dialog allows the user to configure the default pak to be plugged-in at game start time (this can be either Mem Pak, Rumble Pak, or None).  It also allows the user to assign controller buttons to two switches, called "Mempak Switch" and "Rumblepak Switch".  When these buttons are pressed, it will swap in a "virtual memory pak" or a "virtual rumble pak" in the selected controller.  There will also be tactile feedback given when switching paks - plugging in a memory pak will give a weak rumble, while plugging in a rumble pak will give a strong rumble.