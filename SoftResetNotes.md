## Details ##

5.2.6 Non Maskable Interrupt (NMI) Exception
A non maskable interrupt exception occurs when the NMI signal is asserted to the processor. Unlike all other interrupts, this exception is not maskable. An NMI occurs only at instruction boundaries, so does not do any reset or other hardware initialization. The state of the cache, memory, and other processor state is consistent and all registers are preserved, with the following exceptions:
  * The BEV, TS, SR, NMI, and ERL ﬁelds of theStatus register are initialized to a speciﬁed state.
  * TheErrorEPC register is loaded with restart PC, as described inTable 5-5.
  * PC is loaded with16#BFC0 0000.
_Cause_ Register ExcCode Value: None
Additional State Saved: None
Entry Vector Used: Reset 16#BFC0 0000

Operation
```
   StatusBEV <-- 1
   StatusTS <-- 0
   StatusSR <-- 0
   StatusNMI <-- 1
   StatusERL <-- 1
   if InstructionInBranchDelaySlot then
      ErrorEPC <-- restartPC # PC of branch/jump
   else
      ErrorEPC <-- restartPC # PC of instruction
   endif
PC <-- 16#BFC0 0000 
```

## From assemblergames.com ##

Marshallh [wrote](http://www.assemblergames.com/forums/showthread.php?p=477806):

On boot, the PIF inside the n64 starts sending a very, very long sequence of random numbers to the CIC. The PIF is always reading the response back (this is a continuous process while the N64 is turned on).

Once the PIF is happy with the values it's getting back, it releases NMI on the [R4300](https://code.google.com/p/mupen64plus/source/detail?r=4300). This causes an NMI interrupt on the cpu, and causes it to start executing code from the memory location 0xBFC00000. Because all the memory is accessed through the RCP, this small segment of memory is mapped to a small almost 2k chunk of ROM in the PIF called PIF-rom.

The code in there is [r4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) executable code. The actual boot process is pretty convoluted, that's another time. But about halfway through the sequence of boot programs, the [R4300](https://code.google.com/p/mupen64plus/source/detail?r=4300) reads from PIF ram (small 64byte area) and this contains values used in the calculation of the CIC seed. (6102 seed is 0x3f)

The way a game determines whether it's running on a PAL or NTSC console is simple - it's hardcoded in the PIF rom.

If you have a logic analyzer and some tools you can put probes on the lines that go from the PIF to the RCP and catch all the contents of the pif ROM as it's read. This is the only way to get access to it, because after the boot process you will read all 0's from where the PIFrom used to be mapped.

Once you have it dumped you can look for the instruction that loads the register s4 (something like li s4, 0x01) and change it to 0x0 for PAL, and 0x1 for NTSC.

You can also use a boot emulator to do all this, but it means you have to have a way of running your own code. The boot emulator basically runs a version of PIFrom that is hacked to skip the security checks, and you patch in whatever values you want (you can fake different CICs and regions this way)

The CIC seed is also used to checksum the bootcode in the first 4k of game ROM, and to also checksum the first 1MB transferred to make sure the cart interface is reliable.
