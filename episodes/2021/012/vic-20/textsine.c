// /opt/homebrew/Cellar/cc65/2.19/share/cc65/include
// make -f makefile-vic20
// cl65 -t vic20 -I ../../cc65-floatlib/ --lib-path ../../cc65-floatlib -O textsine.c runtime.lib

#include <stdio.h>
#include <stdlib.h>
#include <vic20.h>

#include <float.h>
#include <math.h>

#define XOFST 10
#define YOFST 12
#define XPX 22
#define YPX 23

//#define XSCLE (XPX/640.0f)
//#define YSCLE 10

// https://github.com/mrdudz/cc65-floatlib/blob/master/float.h

void plot(int x, int y, char c, char color) {
  char *char_ptr = (char *) 7680 + y * 22 + x;
  char *color_ptr = (char *) 38400U + y * 22 + x;

  *color_ptr = color;
  *char_ptr = c;
}
// https://en.wikipedia.org/wiki/PETSCII
void graphics() {
  __asm__ ("lda #$8e"); // chr$(14 + 128)
  __asm__ ("jsr $ffd2"); // the CHROUT subroutine
}

void cls() {
  __asm__ ("lda #$93"); // the screen clear character
  __asm__ ("jsr $ffd2"); // the CHROUT subroutine
}

int main(int _argc, char **_argv) {
  const float xofst=itof(XOFST);
  const float yofst=itof(YOFST);
  const float xscle=fdiv(itof(XPX), itof(640));
  const float yscle=itof(10);
  const float radfc=fdiv(fatn(itof(1)),itof(45));
  const float radfc_xscle=fdiv(radfc,xscle);
  const int x_limit = ftoi(fdiv(itof(XPX), xscle));
  int x;
  int y;

  char *ptr=(char*)36879U; // black border black back
  (*ptr)=8;

  graphics();
  cls();

  for(x=0; x < XPX; x++) {
    plot(x,YOFST,(char)81, (char)5);
  }
  for(y=0; y <= YPX; y++) {
    plot(XOFST,y,(char)81, (char)5);
  }
  for(x=0; x < x_limit; x++) {
    float xi=fmul(itof(x),xscle);
    float yi=fadd(
        fmul(yscle,
          fmul(
            fcos(fmul(fsub(xi,xofst),radfc_xscle)),
            itof(-1)
            )
          ),
        yofst);
    // yscle *
    plot(ftoi(xi), ftoi(yi), (char)81, (char)1);
  }
  return EXIT_SUCCESS;
}
