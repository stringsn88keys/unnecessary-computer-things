#include <stdio.h>
#include <stdlib.h>
#include <c64.h>
#include "c64_note_values.h"

const unsigned int notes[][8] = {
  { D3, A2, B2, Fs2, G2, D2, G2, A2 },
  { Fs5, E5, D5, Cs5, B4, A4, B4, Cs5 },
  { D5, Cs5, B4, A4, G4, Fs4, G4, E4 },
};


int main(void) {
  unsigned int i,d;
  unsigned int measure=0;

  SID.amp = 0x1F;
  SID.v1.ad = 0x0f;
  SID.v2.ad = 0x0f;
  SID.v3.ad = 0x0f;

  while(1) {
    for(i = 0; i < sizeof(notes[0]) / sizeof(int); i++) {
      SID.v1.freq = notes[0][i];
      SID.v1.ctrl = 0x11;
      if(measure) {
        SID.v2.freq = notes[1][i];
        SID.v2.ctrl = 0x11;
      }
      if(measure > 1) {
        SID.v3.freq = notes[2][i];
        SID.v3.ctrl = 0x11;
      }
      for(d=0; d<10000; d++) { }
      SID.v1.ctrl = 0x10;
      if(measure) {
        SID.v2.ctrl = 0x10;
      }
      if(measure > 1) {
        SID.v3.ctrl = 0x10;
      }
    }
    measure++;
    if(measure>2) { break; }
  }
  return EXIT_SUCCESS;
}
