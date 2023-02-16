# Monitor Commands

See also [Machine Language Monitor](https://www.commodore.ca/manuals/128_system_guide/app-j.htm)

* `G`O - `G [<address>]`
  * `address` is optional start point, otherwise `PC`
  * Example: `g 0400`
* `L`OAD - `L "FILENAME", devicenumber[, alternate start addr]`
* `R`EGISTERS - displays:
  * `PC` - 5 hex digit 8502 program counter
  * `SR` - 2 hex digit status register
  * `AC` - 2 hex digit 8502 accumulator
  * `XR` - 2 hex digit 8502 X index register
  * `YP` - 2 hex digit 8502 Y index register
  * `SP` - 2 hex digit 8502 stack pointer
* `S`AVE - `S "FILENAME", devicenumber, startaddr, endaddrplus1`
  * `devicenumber` is 8 through 11 for disk, 1 for tape
  * `startaddr` is the first memory address to be saved
  * `endaddrplus1` is the first memory address *not* to be saved
  * Example: `s "game",8,0400,0c00`
* `@` disk things
  * `@,$` - directory
  * `@,i` - initialize drive 8
  * `@` - disk status