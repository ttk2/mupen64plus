Here are some basic usage instructions to compile Mupen64Plus on Intel Macintosh computers with OSX (this is for developers. If you are a user, please just download the binary from the downloads page or, if you want a front-end, look at http://bitbucket.org/auria/wxmupen64plus/wiki/Home ).  As of October, 2011, all of the Mupen64Plus software will compile and run correctly. Please be aware that Mupen64Plus does not currently run on older PowerPC based Macintosh computers.

Please note that these instructions are meant as guidelines for people who know what they're doing. If you don't have much experience building stuff from source, I would recommend that you wait for binary packages instead.

Choose your mupen version :


# Mupen64plus 1.99.x and 2.x #

  * Install developer tools (Xcode) from the DVD that came with your Mac.

  * Get the code from the various modules using mercurial as on any other platform (or just download a source code archive)
Get the dependencies just like you'd do for mupen64plus 1.x (except maybe GTK/Qt since there is no GUI frontend yet for mupen 2)

  * Install pkg-config if you don't already have it


Create this file, called **zlib.pc**, in /usr/local/lib/pkgconfig
```sh

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include


Name: zlib
Version: 1.1.3
Description: zlib
Requires:
Libs: -L${libdir} -lz
Cflags: -I${includedir}```

Create this file, called **gl.pc**, in /usr/local/lib/pkgconfig
```sh

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include


Name: gl
Version: 2.0
Description: OpenGL
Requires:
Libs: -framework OpenGL
Cflags: -I${includedir}```

Create this file, called **glu.pc**, in /usr/local/lib/pkgconfig
```sh

prefix=/usr
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
includedir=${prefix}/include


Name: glu
Version: 2.0
Description: glu
Requires:
Libs:
Cflags: -I${includedir}```


A script to build (32 bits, compatible with 10.6/10.5 and maybe 10.4) looks like :

```sh

PWD = pwd
export CC="gcc-4.0"
export CXX="g++-4.0"
export LD="g++-4.0"
APIDIR=$PWD/mupen64plus-core/src/api
export MACOSX_DEPLOYMENT_TARGET=10.4
export SDK_ROOT=/Developer/SDKs/MacOSX10.5.sdk
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

APP_BUNDLE=./mupen64plus.app/Contents

export CFLAGS="-g"
export CXXFLAGS="-g"

echo "== Core =="
cd mupen64plus-core/projects/unix
make all V=1
cd ../../..
cp -f mupen64plus-core/projects/unix/*.dylib .

echo "== RSP-HLE =="
cd mupen64plus-rsp-hle/projects/unix
make all V=1
cd ../../..
cp -f mupen64plus-rsp-hle/projects/unix/*.dylib .

echo ""
echo "== SDL Audio =="
cd mupen64plus-audio-sdl/projects/unix
make all V=1
cd ../../..
cp -f mupen64plus-audio-sdl/projects/unix/*.dylib .

echo ""
echo "== SDL Input =="
cd mupen64plus-input-sdl/projects/unix
make all V=1
cd ../../..
cp -f mupen64plus-input-sdl/projects/unix/*.dylib .

echo ""
echo "== Rice =="
cd mupen64plus-video-rice/projects/unix
make all CC="g++-4.0" C_INCLUDE_PATH="/usr/local/include" CPLUS_INCLUDE_PATH="/usr/local/include" V=1 BITS=32 PIC=1
cd ../../..
cp -f mupen64plus-video-rice/projects/unix/*.dylib .

echo ""
echo "== Arachnoid =="
cd mupen64plus-video-arachnoid/projects/unix
make all C_INCLUDE_PATH="/usr/local/include" CPLUS_INCLUDE_PATH="/usr/local/include" V=1
cd ../../..
cp -f mupen64plus-video-arachnoid/projects/unix/*.dylib .

echo ""
echo "== Glide =="
cd mupen64plus-video-glide64/projects/unix
make all C_INCLUDE_PATH="/usr/local/include" CPLUS_INCLUDE_PATH="/usr/local/include" V=1
cd ../../..
cp -f mupen64plus-video-glide64/projects/unix/*.dylib .

echo ""
echo "== Glide Napalm =="
cd mupen64plus-video-glide-napalm/Glitch64
make -f Makefile.gcc OSX_ARCH=i386 EXT_INC="../../mupen64plus-core/src/api -I./inc"
cd ../src
make -f Makefile.nowx-gcc all C_INCLUDE_PATH="/usr/local/include:../../mupen64plus-core/src/api" CPLUS_INCLUDE_PATH="/usr/local/include:../../mupen64plus-core/src/api" OSX_ARCH=i386
cd ../..
cp -f mupen64plus-video-glide-napalm/src/lib/*.dylib .
cp -f mupen64plus-video-glide-napalm/src/*.dylib .

echo ""
echo "== Console =="
cd mupen64plus-ui-console/projects/unix
make all V=1
cd ../../..
cp -f mupen64plus-ui-console/projects/unix/mupen64plus .

mkdir -p $APP_BUNDLE/MacOS/
cp -f mupen64plus $APP_BUNDLE/MacOS/mupen64plus
cp -f *.dylib $APP_BUNDLE/MacOS/.
```

To build 64-bits, use something like that instead (tested on 1.6) :
```sh

#!/bin/sh
PWD = `pwd`

APIDIR=$PWD/mupen64plus-core/src/api
export LD="g++"

APP_BUNDLE=./mupen64plus.app/Contents

echo "== Core =="
cd mupen64plus-core/projects/unix
make all APIDIR=$APIDIR ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-core/projects/unix/*.dylib .

echo "== RSP-HLE =="
cd mupen64plus-rsp-hle/projects/unix
make all APIDIR=$APIDIR ARCH_DETECTED=64BITS LD="g++"
cd ../../..
cp -f mupen64plus-rsp-hle/projects/unix/*.dylib .

echo ""
echo "== SDL Audio =="
cd mupen64plus-audio-sdl/projects/unix
make all APIDIR=$APIDIR ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-audio-sdl/projects/unix/*.dylib .

echo ""
echo "== SDL Input =="
cd mupen64plus-input-sdl/projects/unix
make all APIDIR=$APIDIR ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-input-sdl/projects/unix/*.dylib .

echo ""
echo "== Rice =="
cd mupen64plus-video-rice/projects/unix
make all APIDIR=$APIDIR NO-ASM=1 C_INCLUDE_PATH=/usr/local/include ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-video-rice/projects/unix/*.dylib .

echo ""
echo "== Arachnoid =="
cd mupen64plus-video-arachnoid/projects/unix
make all C_INCLUDE_PATH="/usr/local/include" CPLUS_INCLUDE_PATH="/usr/local/include" ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-video-arachnoid/projects/unix/*.dylib .

echo ""
echo "== Glide =="
cd mupen64plus-video-glide64/projects/unix
make all C_INCLUDE_PATH="/usr/local/include" CPLUS_INCLUDE_PATH="/usr/local/include" ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-video-glide64/projects/unix/*.dylib .

echo ""
echo "== Console =="
cd mupen64plus-ui-console/projects/unix
make all APIDIR=$APIDIR ARCH_DETECTED=64BITS
cd ../../..
cp -f mupen64plus-ui-console/projects/unix/mupen64plus .

mkdir -p $APP_BUNDLE/MacOS/
cp -f mupen64plus $APP_BUNDLE/MacOS/mupen64plus
cp -f *.dylib $APP_BUNDLE/MacOS/.
```

**Macports users, you will need to add flags like this to the end of many of the _make_ commands above :
```
LIBRARY_PATH=/opt/local/lib
C_INCLUDE_PATH="/opt/local/include/libpng12"
CPLUS_INCLUDE_PATH="/opt/local/include/libpng12"
```**


And a script to bundle may look like :

```sh

#!/bin/sh
APP_CONTENTS="./mupen64plus.app/Contents"

FIX_LIST="-x $APP_CONTENTS/MacOS/mupen64plus \
-x $APP_CONTENTS/MacOS/libmupen64plus.dylib \
-x $APP_CONTENTS/MacOS/mupen64plus-audio-sdl.dylib \
-x $APP_CONTENTS/MacOS/mupen64plus-input-sdl.dylib \
-x $APP_CONTENTS/MacOS/mupen64plus-rsp-hle.dylib \
-x $APP_CONTENTS/MacOS/mupen64plus-video-rice.dylib \
-x $APP_CONTENTS/MacOS/mupen64plus-video-arachnoid.dylib \
-x $APP_CONTENTS/MacOS/mupen64plus-video-glide64.dylib"


dylibbundler -od -b $FIX_LIST -d $APP_CONTENTS/libs/

rm -rf $APP_CONTENTS/Resources
mkdir -p $APP_CONTENTS/Resources
cp ./mupen64plus-video-rice/data/* $APP_CONTENTS/Resources
cp ./mupen64plus-video-glide64/data/* $APP_CONTENTS/Resources
cp ./mupen64plus-core/data/* $APP_CONTENTS/Resources
cp ./mupen64plus-input-sdl/data/*  $APP_CONTENTS/Resources
```

this script requires [macdylibbundler](http://macdylibbundler.sourceforge.net/) to be installed.

Currently this only runs from the terminal.


# Mupen64plus 1.x #

## Developer tools ##
Install developer tools (Xcode) from the DVD that came with your Mac.

## GETTING MUPEN64PLUS ##
You can simply download a source archive from the mupen64plus website; you can also use SVN. SVN example :
```
mkdir mupen64plus
cd mupen64plus
svn co svn://fascination.homelinux.net:7684/mupen64plus/trunk --username mupen64 --password Dyson5632-kart
```

## DEPENDENCIES ##
  * Mupen can be built with either GTK+ or Qt. It is expected that in the future the Qt version will work better, but until then the GTK+ version is easier to get to run. Install GTK+ from http://www.gtk-osx.org/. (If you like using macports, beware : GTK as installed from macports _will_ work on your computer, but you won't be able to package a distributable dmg. The installer from the website mentionned is much more handy for this)

  * Other dependencies can be installed either from source or from macports.

### (A) THE SOURCE CODE WAY ###
You will need SDL, SDL\_ttf and its subdependencies (Freetype, fontconfig), and libpng.
Find them with [Google](http://www.google.com) and install them with the usual
```
./configure
make
sudo make install
```

### (B) THE MACPORTS WAY ###
  * Install macports from [macports.org](http://www.macports.org/install.php)
  * Open terminal (under Hard Drive, Applications, Utilities, Terminal). Type in the following commands.
```
sudo port install libsdl_ttf libpng
```

Since macports installs librairies in a non-standard prefix, you will need to help the makefiles find librairies installed from macports. You can simply export LDFLAGS=-L/opt/local/lib or, more conveniently, change it on a more permanent basis by editing **pre.mk** in the mupen source - then locate the lines that read
```
OS = OSX
LDFLAGS += -liconv -lpng
```
and make the second one
```
LDFLAGS += -L/opt/local/lib -liconv -lpng
```


## BUILDING MUPEN64PLUS ##
We'll first set some environment variables to help mupen find GTK+. Also make sure sdl-config is in your PATH.
```
export PKG_CONFIG_PATH=/Library/Frameworks/Gtk.framework/Resources/dev/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/Library/Frameworks/GLib.framework/Resources/dev/lib/pkgconfig
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/Library/Frameworks/Cairo.framework/Resources/dev/lib/pkgconfig 
```
Then cross your fingers, it's time to build!
```
cd /path/to/mupen/trunk
make all
```

Or, for a debug build:
```
make DBGSYM=1 all
```

## RUNNING ##
```
cd mupen64plus/trunk/
./mupen64plus
```

To run no gui mode :
```
# simplest :
./mupen64plus --nogui <rom-path>

# pass some settings
./mupen64plus --nogui --gfx plugins/glN64.so --audio plugins/jttl_audio.so --input plugins/blight_input.so --rsp plugins/mupen64_hle_rsp_azimer.so --emumode 1 <rom-path>
```

Be aware that input may not work if you launch ROMs in GUI mode.

## PACKAGING MUPEN64PLUS ##
If all you wanted is to play with Mupen64Plus, this section won't apply to you; but we want to share the fun with others, don't we? From now on, I'll concentrate on how to build a package you can send to others.

Start by installing mupen :
```
sudo ./install.sh
```

You will first need an **Info.plist** file, sample here :
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key> <string>English</string>
	<key>CFBundleInfoDictionaryVersion</key> <string>6.0</string>
	<key>CFBundlePackageType</key> <string>APPL</string>
	<key>CSResourcesFileMapped</key>  <true/>

	<key>CFBundleExecutable</key>  <string>launcher</string>
	<key>CFBundleName</key>        <string>Mupen64Plus</string>
	<key>CFBundleIconFile</key>    <string>mupen64plus.icns</string>
	<key>CFBundleVersion</key>     <string>1.5</string>
	
		
	<key>CFBundleDocumentTypes</key>
	<array>
		<dict>
			<key>CFBundleTypeExtensions</key>
			<array>
				<string>n64</string>
				<string>N64</string>
				<string>z64</string>
				<string>V64</string>
				<string>v64</string>
				<string>V64</string>
			</array>
			<key>CFBundleTypeIconFile</key>
			<string>mupen64cart.icns</string>
			<key>CFBundleTypeName</key>
			<string>N64 Rom</string>
			<key>CFBundleTypeRole</key>
			<string>Editor</string>
			<key>LSIsAppleDefaultForType</key>
			<true/>
			<key>LSTypeIsPackage</key>
			<false/>
		</dict>
		
	</array>
	
</dict>
</plist>
```
(note that the executable name in this Info.plist file is _launcher_ - I'll explain why below)

You will also need icons for mupen and ROMs : mupen64plus.icns, mupen64cart.icns

Then you can build the application bundle by using a simple shell script :
```
INSTALL_PREFIX="/usr/local"
APP_CONTENTS="./Mupen64Plus.app/Contents"

echo "* Removing any existing installation"
rm -rf ./Mupen64Plus.app

echo "* Creating skeleton"
mkdir -p $APP_CONTENTS/Resources
mkdir $APP_CONTENTS/MacOS
cp Info.plist $APP_CONTENTS/Info.plist
cp mupen64plus.icns $APP_CONTENTS/Resources/mupen64plus.icns
cp mupen64cart.icns $APP_CONTENTS/Resources/mupen64cart.icns

echo "* Copying executable"
cp $INSTALL_PREFIX/bin/mupen64plus $APP_CONTENTS/MacOS/mupen64plus
#cp ./launcher $APP_CONTENTS/MacOS/launcher

echo "* Copying data files"
cp -r $INSTALL_PREFIX/share/mupen64plus/ $APP_CONTENTS/Resources/
```

You can then make this bundle distributable by blessing it with [DylibBundler](http://macdylibbundler.sourceforge.net). First install DylibBundler by following the instructions inside. Then run this small script :

```
APP_CONTENTS="./Mupen64Plus.app/Contents"

FIX_LIST="-x $APP_CONTENTS/MacOS/mupen64plus \
-x $APP_CONTENTS/Resources/plugins/blight_input.so \
-x $APP_CONTENTS/Resources/plugins/dummyaudio.so \
-x $APP_CONTENTS/Resources/plugins/dummyvideo.so \
-x $APP_CONTENTS/Resources/plugins/glide64.so \
-x $APP_CONTENTS/Resources/plugins/glN64.so \
-x $APP_CONTENTS/Resources/plugins/jttl_audio.so \
-x $APP_CONTENTS/Resources/plugins/mupen64_hle_rsp_azimer.so \
-x $APP_CONTENTS/Resources/plugins/mupen64_input.so \
-x $APP_CONTENTS/Resources/plugins/ricevideo.so"

dylibbundler -od -b $FIX_LIST -d $APP_CONTENTS/libs/
```

Voila it's ready! Well actually, it should be in theory... In practice there is a bug on mac : when using both SDL and GTK+ at the same time, both grab the event loop and conflict with each other. The result of this is that ROMs cannot be launched from the GTK GUI, they can only be run in _nogui_ mode. The GTK interface however still remains necessary to configure mupen. Until this issue gets fixed properly, I work around it by placing a second executable in the bundle called _launcher_ (see the bundling script above, there is a commented out line that does this). This executable can then act as a bridge to either open the GTK GUI and configure mupen, either launch a ROM in nogui mode.

--> MacLauncher

With this launcher as main executable, you should finally have a distributable executable!

To be continued...