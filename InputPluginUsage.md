## Use Cases ##

  * **Use case #1 scenario**: First-time user of Mupen64Plus, has no configuration file.
    * **Desired Behavior**:
      * Automatically detect and configure any supported joysticks, assigning them in sequence to controllers.
      * Skip any unsupported joysticks without leaving unconfigured controllers.
      * If no SDL joysticks are found, configure the keyboard/mouse.
      * Fill in (blank) settings for all 4 controllers (for GUI front-ends)
    * **How to configure**: Automatic.
      * If no configuration is found for a controller (or version is out of date), it will automatically be set to mode 2 (fully automatic), and saved.

  * **Use case #2 scenario**: User changes controllers often (configuration file is present)
    * **Desired Behavior**:
      * Automatically detect and configure any joysticks plugged in
      * Skip any unsupported joysticks without leaving unconfigured controllers.
      * If no SDL joysticks are found, configure the keyboard/mouse.
      * Don't stick to old input settings in configuration file when a different joystick is used
      * User should be able to modify the auto-configured settings (edit InputAutoConfig.ini)
    * **How to configure**: Automatic
      * User should set all controllers to mode 2 (fully auto) in this scenario, and edit his controller preferences in the InputAutoConfig.ini file.

  * **Use case #3 scenario**: User switches between keyboard and joystick
    * **Desired Behavior**:
      * If joystick is plugged in, then set up according to configuration file (if it matches), or auto-config
      * If no SDL joysticks are found, configure the keyboard/mouse.
    * **How to configure**:
      * User should set all controllers to mode 2 (fully auto) in this scenario, and edit his controller preferences in the InputAutoConfig.ini file.

  * **Use case #4 scenario**: Developer wants to create a specific input configuration for testing purposes: no controllers, only a controller in port 2, etc.
    * **How to configure**: Set all controller **`mode`** parameters to 0, set other configuration parameters as necessary.

  * **Use case #5 scenario**: A user wants has several different controllers plugged in, and wants to set a specific one (which may not be SDL joystick 0) to be N64 controller 0.  The user also wants the configuration to be automatic (doesn't want to have to set up the joystick manually).
    * **How to configure**: Set controller #1 **`mode`** parameter to 1, and set the SDL joystick name of your desired main controller in to the **`name`** parameter.

## Design Changes ##
  * changes relative to Hg rev 173:725bc6d288ae
  * Changes to `[Input-SDL-Control*]` sections
    * **`version`** changes from 1 to 2
    * Add parameter **`mode`**: 0 = Fully Manual, 1 = Automatic with named SDL device, 2 = Fully Automatic.  GUI front-ends should make all of the controller's other parameters read-only when the mode is set to 2, and should make all parameters except **`name`** read-only when the mode is set to 1.
    * For the **`device`** parameter, remove the `-2` option (keyboard input should automatically work for any N64 controller which maps keys), and change the semantic of the `-1` option to mean "No SDL joystick" instead of "Auto-config".  For modes 1 and 2, this parameter will be set by the input plugin.  The user can only set this parameter for mode 0.
    * For the **`name`** parameter: Similar to previous usage, but mode-dependent: For mode 0, name of joystick/keyboard which was last used (set by plugin). For mode 1, name of desired joystick/keyboard to use for this controller (set by user).  For mode 2, ignored.