# Rom Cache System (RCS) Concept #

## Overview ##

**Objective:** Create a system that passively retrieves/loads information about the Rom Browser, and current ROM being played.

**Operations:** Start the RCS when Mupen64Plus is executed. If -–nogui is specified then do not worry about the Rom Browser operations.

_The RCS will be responsible for the following tasks:_
  * Caching the MD5, Filename, Good Name (from database), and OS Timestamp (for checking if a file has changed) of each of the entries in the Rom Browser. This file will be external and will be loaded when the GUI version boots up to speed up the Rom Browser creation.
  * Reading a ROM database that contains meta information about each ROM. This file will be external and replace mupen64plus.ini
  * Sending a notification to the Rom Browser to update the list with new information when the initial caching is going on.
  * Storing global information about the current ROM being played.

## Other Information ##

When creating the Rom List, it would not be proper to display ROMs that have not been initially cached. Once they have been cached with the MD5, Good Name lookup, and Filename they should be displayed onto the Rom Browser.

The process of caching should not be redundant and should only occur if the cache file does not exist, or the Refresh is selected. In the case that Refresh is selected, the files should be checked against the already cached files to speed up performance. Any files that are not existing anymore should be removed from the cache file.

The caching thread should be halted when the user starts a ROM, and should resume caching as if the Rom Browser has been refreshed. It should be continued when the user stops the ROM.

## File Structure ##

Since there is a bulk list of ROMS, we want our list to be cross referencing itself. Please look at the following flags that will be included:

```
[MD5]
CRC=CRC
GoodName=STRING
Compatible=STRING
ExpansionPack=1/0
SoftHack=CODE0001 CODE, CODE0002 CODE
Reference=MD5
```

A lot of this should be self explanatory, however just for note... if a reference is used, the ROM will inherit the referenced MD5 properties, and then they can be modified as needed. If you feel like something should be added to the database please feel free to comment in the appropriate discussion so it gets noted.