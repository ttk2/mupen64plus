# Oh no, my controller doesn't work??!?!?!? #

If when running Mupen64Plus you see an error message such as:

```
Input: No auto-configuration found for device 'My Awesome Controller'
Input Warning: No joysticks/controllers found
Input: Forcing keyboard input for N64 controller #1
Input: Using auto-configuration for device 'Keyboard'
```

Then this guide is for you.

## Configuring the controller ##

Take a look at the InputAutoCfg.ini file.  If you are using Linux and have installed Mupen64Plus, this should be in either /usr/local/share/mupen64plus or /usr/share/mupen64plus, or (if you are using Windows or haven't installed Mupen64Plus to your system) in the same directory as everything else.

Copy and paste one section of the configuration file and change the name between the brackets (`'['` and `']'`) to whatever the name of your controller is (should be printed out by Mupen64Plus, in this example 'My Awesome Controller').

So let's say for example you've copied the section 'Mega World USB Game Controllers' and changed the name of the section. You should have:

```
[My Awesome Controller]
plugged = True
plugin = 2
mouse = False
AnalogDeadzone = 4096,4096
AnalogPeak = 32768,32768
DPad R = hat(0 Right)
DPad L = hat(0 Left)
DPad D = hat(0 Down)
DPad U = hat(0 Up)
Start = button(9)
Z Trig = button(7)
B Button = button(0)
A Button = button(2)
C Button R = axis(3+)
C Button L = axis(3-)
C Button D = axis(2+)
C Button U = axis(2-)
R Trig = button(6)
L Trig = button(4)
Mempak switch =
Rumblepak switch =
X Axis = axis(0-,0+)
Y Axis = axis(1-,1+)
```

somewhere in InputAutoCfg.ini. Now all you need to do is to change the values to correspond to your controller. It shouldn't be too hard to figure out how to change the values, but there is some documentation at https://github.com/mupen64plus/mupen64plus-core/wiki/Mupen64Plus-Plugin-Parameters#wiki-InputSDL if you need it. Remember that on some controllers the D-Pad is just another axis, in those cases replace hat() with axis() (make sure you use the correct syntax for axis).  You may also use the SDL joystick testing programs (available on our Downloads page) to determine the button/axis/hat numbers which correspond to the various controls on your joystick.

### Using a Mouse ###
You can enable mouse control of the analog stick by setting the "mouse" parameter to True in your input config section.  There is a parameter to control the sensitivity of the mouse movement (called "MouseSensitivity").  The default value for MouseSensitivity is "2.00,2.00".  You can also bind mouse buttons to the N64 controller buttons by adding a clause to the button binding string.  For example: Start = "button(9) mouse(0)" will bind the N64 controller Start button to button 9 on the joystick and button 0 on the mouse.

When the mouse is enabled, Mupen64Plus will "grab" the mouse, so you will not see the pointer, even when running in windowed mode.  To toggle the mouse grab while playing a game, press the Left Control and Left Alt keys together.

### Special Macintosh Instructions ###
To use an Xbox360 controller with a Macintosh, you can use the TattieBogle Driver from [tattiebogle.net](http://tattiebogle.net/index.php/ProjectRoot/Xbox360Controller/OsxDriver).  There is also an image which demonstrates the button mappings on [imgur](http://imgur.com/yb8rV).

## Ok, it's working, now what? ##

If you've got a nice configuration you can send it to the Mupen64Plus team at mupen64plus@googlegroups.com. That way they will be able to include the configuration in the official Mupen64Plus releases. Make sure to include the exact name of the controller and a description as well.