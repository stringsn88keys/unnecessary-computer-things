# Notes

## Dependencies
Build `cc65-floatlib` first. If you get undefined references coming fom the compilation of `floattest.c`, then remove `floattest` from the `all:` target. [cc65-floatlib issue #2](https://github.com/mrdudz/cc65-floatlib/issues/2)

```shell
git clone https://github.com/mrdudz/cc65-floatlib.git
cd cc65-floatlib
# remove floattest from the all: target if you get errors 
make -f makefile-vic20
cd ..
cl65 -t vic20 -I cc65-floatlib/ --lib-path cc65-floatlib/ -O textsine.c runtime.lib
``` 

## Running 
"File -> Smart attach disk/tape/cartridge..." and select the extensionless compiled binary.

OR

"Autostart disk/tape image..." and switch file filter to `All Files *.*`. Click [Autostart] to actually load and run.
