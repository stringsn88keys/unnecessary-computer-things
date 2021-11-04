#include <stdio.h>

const unsigned int scale[] = {
  268,284,301,318,337,358,379,401,425,451,477,506,
  536,568,602,637,675,716,758,803,851,902,955,1012,
  1072,1136,1204,1275,1351,1432,1517,1607,1703,1804,1911,2025,
  2145,2273,2408,2551,2703,2864,3034,3215,3406,3608,3823,4050,
  4291,4547,4817,5103,5407,5728,6069,6430,6812,7217,7647,8101,
  8583,9094,9634,10207,10814,11457,12139,12860,13625,14435,15294,16203,
  17167,18188,19269,20415,21629,22915,24278,25721,27251,28871,30588,32407U,
  34334U,36376U,38539U,40833U,43258U,45830U,48556U,51443U,54502U,57743U,61176U,64814U
};

const char notes[][3][4] = {
  {"Bs", "C", "Dbb"},
  {"Bx", "Cs", "Db"},
  {"Cx", "D", "Ebb"},
  {"Ds", "Eb", "Fbb"},
  {"Dx", "E", "Fb"},
  {"Es", "F", "Gbb"},
  {"Ex", "Fs", "Gb"},
  {"Fx", "G", "Abb"},
  {"Gs", "Ab", ""},
  {"Gx", "A", "Bbb"},
  {"As", "Bb", "Cbb"},
  {"Ax", "B", "Cb"}
};

int effective_octave(char *note, int octave) {
  if(note[0]=='C' && note[1] =='b') {
    octave += 1;
  }
  if(note[0]=='B' && (note[1] == 'x' || note[1] == 's')) {
    octave -= 1;
  }
  return octave > 7 ? -1 : octave;
}

int main(int argc, char **argv) {
  printf("#ifndef _C64_NOTE_VALUES_H\n");
  printf("#define _C64_NOTE_VALUES_H\n");
  for(int octave=0; octave<8; octave++) {
    for(int pitch=0; pitch < sizeof(*notes); pitch++) {
      for(int synonym=0; synonym < 3 && notes[pitch][synonym][0]; synonym++) {
        char *note=notes[pitch][synonym];
        if(effective_octave(note, octave) != -1) {
          printf("#define %8s%d %8d%c\n", notes[pitch][synonym], effective_octave(note,octave), scale[octave*12+pitch], scale[octave*12+pitch] > 32767 ? 'U' : ' ');
        }
      }
    }
  }
  printf("#endif\n");
}
