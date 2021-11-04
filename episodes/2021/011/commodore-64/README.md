# commodore-64-cc65
cc65 source for building Commodore 64 machine language programs

## Building/running 
`cl -O canonind.c` and "Smart attach disk/tape/cartridge" with the binary `canonind` in VICE.

`run` in the Commodore 64 after attach (or click the "Autostart" button in the Smart attach dialog.)

## FILES

* `sid.c` - multisid scale test (you'll need to enable an additional SID in VICE on `0xDE00` and `0xDF00` for the full effect)
* `scale.c` - C program to write out a new `c64_note_values.h`. `make scale && ./scale > c64_note_values.h` on a Unix-like environment.
* `canonind.c` - Pachelbel's "Canon in D" (first 6 measures)
* `c64_note_values.h` - `#define`d note values.

## Resources

[Commodore 64 specific information for cc65](https://cc65.github.io/doc/c64.html#ss8.1)
[cc65 compiler intro](https://cc65.github.io/doc/intro.html)
[Recreating the Commodore 64 User Guide Code Samples in cc65](https://odensskjegg.home.blog/2019/12/28/recreating-the-commodore-64-user-guide-code-samples-in-cc65-part-four-sound/)
