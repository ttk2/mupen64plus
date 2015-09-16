# Introduction #

**Mupen64Plus**, Originally **Mupen64-64bit**, created by Richard42, is a fork of **Mupen64**, An N64 emulator created by Hacktarux. **Mupen64-64bit** was started sometime after the first release of a quick attempt to port **Mupen64** to x86\_64/AMD64/EM64T was released.

**Mupen64Plus** is Open Source, as it is required as a derivative of the GPLv2 software, **Mupen64** . All source code to all plug-ins are redistributed under the license they were originally redistributed under. The latest snapshot of source is publicly available via offsite SVN under a special user (Who's information is listed on the Project Homepage.)


# History #

On October 10th, 2007, A branch off of **Mupen64** was presented to the public as **Mupen 64bit** [[Go→](http://emutalk.net/showthread.php?t=42243)].  First released by nmn, it contained a buggy version of glN64, JTTL's Audio Plug-in, A broken release of Blight's SDL Input plug-in, And the original r4300 emulation minus dynamic recompiling. (No attempt to port it was made as of the original release) On October 14th, 2007, Richard42 had decided to help on the project. On October 21st, 2007, the original port was finally dumped and the project gained a new name, **Mupen64-64bit**. Essentially, It was a new project, being started from the vanilla Mupen64 0.5 source code.

**Mupen64-64bit** was soon renamed **Mupen64-amd64**. During this next period many of the fork's most important achievements were made. A Dynamic Recompiler was developed, Many of the largest bugs were fixed, and the emulator's GUI was renovated.

After a while, it became clear that the name **Mupen64-amd64** was giving the impression that the emulator did not support 32-bit Intel x86 processors. Finally, It was decided to rename the project to **Mupen64Plus**, and the project gained a homepage at Google Code, where it sits today.

# Progress #

Although the original goals of the initial project were only to port the emulator to 64-bit Intel and fix bugs, not long after Richard42 arrived, it was decided that the project should also aim to improve the quality of **Mupen64**. Currently, the project has deviated off of the original **Mupen64** quite much. The main differences are:

  * New Makefile, supporting PPC (broken as of now) and x86 targets for 64-bit and 32-bit.
  * New GTK code, with much less deprecated GTK functions and widgets
  * A Qt4 GUI
  * A port of Rice Video, with countless fixes and renovations
  * A port of Glide64 Wonder Plus
  * Improvements to glN64
  * 64-bit Dynamic Recompiler
  * A brand new Windows port using GTK

# Usage #

Currently, **Mupen64Plus** only compiles under Intel processors on the Linux platform (Other UNIX like Operating Systems should work as long as you have GNU Make and GCC for compilation). Simply use "make all" to compile the emulator, provided all prerequisites are properly installed and working.

An effort to port **Mupen64Plus** to Microsoft Windows is under way. Fixes to the build system that will allow users of PowerPC Linux to run **Mupen64Plus** should be released soon.

# Plugins #

Currently, **Mupen64Plus** has 10 Plug-ins. 4 Video plug-ins, 3 audio plug-ins, 2 input plug-ins and 1 RSP plug-in.

**Video:**
  * glN64
  * No Video
  * Glide64 Wonder Plus
  * Rice's Video Plugin (With mudlord's extensions)

**Audio:**
  * Mupen64 Audio Plugin (May become obsolete)
  * No Audio
  * JttL's SDL Audio

**Input:**
  * Mupen64 Basic Input Plugin
  * Blight's SDL Input Plugin

**RSP:**
  * Hacktarux/Azimer HLE RSP Plugin