**Country**

The release country code for commercial ROMs and N64 tools. Usually this is an indication of the default language and / or target audience for a game. Homebrew programs may use a region code or simply identify as Demos. Additionally, prelease versions of commercial ROMs are flagged as Betas.

**GoodName**

GoodN64 is a database of nearly all known N64 ROMs created by Cowering (www.allgoodthings.us). Mupen64Plus uses these names to distinguish ROMs as the file may be misnamed. Each ROM is assigned a unique Good Name on the following criteria:

Release country code for commercial ROMs:
  * (JU) USA/Japan
  * (G) Germany
  * (U) USA
  * (F) France
  * (I) Italy
  * (J) Japan
  * (S) Spain
  * (A) Australia
  * (E) Europe
  * or (PD) Public Domain for homebrew.

Additionally, each name has at least one of the following codes:

  * `[!]` - Verified Good Dump - If these ROMs don't work, it is an emulation bug.
  * `[a#]` - Alternative - An alternate working version of a ROM.
  * `(M#)` - Multilanguage - Official support for # of languages.
  * `[o#]` - Overdumped - An overdumped ROM image has more data than is actually in the cart. Besides wasting space, the ROM should be okay.

The following codes indicate that the ROM was modified or hacked in some manner. Mupen64Plus will issue a warning when trying to load one of these ROMs, although many should work fine.

  * `[T?]` - Translation - Unlike multilanguage support from (M#) ROMs, these translations were made by hackers to allow access of games to a broader audience. As performing such a translation involves manipulating large amounts of ROM data, it is possible unintended bugs were introduced. `[T+?` indicates a newer translation, while `[T-?` indicates an older release. If a translation doesn't work, you might want to obtain a newer version.
  * `[t#]` - Trained - A trainer is special code which executes before the game is begun. It allows you to access cheats from a menu.
  * `[h#]` - Hacked - A general hacked ROM. Hacks range from changed headers to allow running in different regions, release group intros, or just some kind of cheating or funny hack.
  * `[b#]` - Bad Dump - A released bad dump, either due to a faulty dumping or corruption on upload.
  * `[f#]` - Fixed - A ROM has been altered in some way so that it might run better, usually from the perspective of using a hardware copier.

**Status**

Mupen64Plus uses a 0-5 star ranking system to give a rough indication of how well a given ROM works with the emulator. Additionally this can be viewed as the probably the ROM will work for a given system.

0 stars - Unknown / Critical Issues - The ROM doesn't load or crashes the emulator. Definitely won't work.

1 star - Severe Issues - The ROM loads, but is unplayable. This is usually due to one of the following: no input, no audio, or no video with any plugin combination. Probably won't work.

2 stars - Moderate Issues - Playable with one plugin combination on some systems. Might work.

3 stars - Mild Issues - Playable with multiple plugins but sometimes with severe artifacts. Will likely work.

4 stars - Minor Issues - Only minor artifacts with all plugins. Should work.

5 stars - Perfect - No known issues. Will definitely work.

**User Comments**

Mupen64Plus gives users the ability to enter short (256 byte) comments to label or classify ROMs without having to rename the files. Some possible uses are to track game progress while playing a number of ROMs, rank ROMs based on preference, or make notes of emulation issues for helping with development.

**File Name**

The file name or full path of the ROM.

**MD5 Hash**

The md5sum of the ROM data. Used to differentiate ROMs.

**CRC1**

The first 4 bytes of the ROM's identifying CRC code, located in the header of the N64 ROM format. This is largely for legacy purposes as ROMs used to be differentiated by CRC. However, as it is possible for the header to be corrupt and / or many different ROMs to share the same CRC, MD5 hashes of the entire ROM file are now used instead. Many cheat codes and video plugins still reference this information, so it is useful for the end user.

**CRC2**

The second 4 bytes of the ROM's identifying CRC code, located in the header of the N64 ROM format. This is largely for legacy purposes as ROMs used to be differentiated by CRC. However, as it is possible for the header to be corrupt and / or many different ROMs to share the same CRC, MD5 hashes of the entire ROM file are now used instead. Many cheat codes and video plugins still reference this information, so it is useful for the end user.

**Internal Name**

A 20 byte SHIFT\_JIS identifying string located in the header of the N64 ROM format. This is largely for informational purposes, though some video plugins may use this name for things like hi-res textures.

**Save Type**

The native save format of a given ROM. N64 cartridges had a number of different internal save options. These include 4KB or 16KB of Eeprom, 32KB of battery backed SRAM, or 256KB of Flash RAM. Additionally, many N64 games used an external Controller Pack for game saves. The official version of this was 256KB of battery backed SRAM, although 3rd party models often had much more. This information is used by the emulator in the booting process.

**Players**

The number of players 0-4 supported by the ROM. 0 Player ROMs are generally homebrew laminations or other Demos.

**Size**

The size of the uncompressed ROM. Useful for debugging.

**Compression**

A number of different ROM compression formats are supported including Gzip, Bzip2, LZMA stream, Zip, and 7zip. Zip and 7zip are archive formats, and Mupen64Plus supports having multiple ROMs in a single image.

**Image Type**

N64 ROMs come in three types: .z64 (native) images, .v64 (byteswapped) image, and .n64 (wordswapped). The names are mainly historical and refer to original backup units used to dump the ROMs. Mupen64Plus can take any image type, but other emulators might not. Also, all MD5s are of the native .z64 image.

**CIC Chip**

The Boot CIC is a security chip that exists in Nintendo64 cartridges that the ROM uses to boot. It is designed for copy protection. Most ROMs only access this information at boot, but others (notably those produced by Rare) access it at other points during gameplay. This is provided largely for informational purposes as Mupen64Plus successfully emulates all known CICs.

**Rumble**

Does the ROM support a rumble pack on a real N64? If Yes, it should be possible to get rumble through emulation.