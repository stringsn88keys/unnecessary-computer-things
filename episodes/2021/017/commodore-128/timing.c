// cl65 -t c128 -O timing.c

#include <stdio.h>
#include <stdlib.h>
#include <c128.h>

#define JIFFY_TIME ((*(unsigned char*)160)*65536 + (*(unsigned char*)161)*256 + (*(unsigned char*)162))
#define JIFFY_SMALLS ((*(unsigned char*)161)*256 + (*(unsigned char*)162))
#define JIFFY_LOW_BYTE (*(unsigned char*)162)

int jiffy_time() {
  int h = *(unsigned char*)160;
  int m = *(unsigned char*)161;
  int l = *(unsigned char*)162;

  return (h * 65536 + m * 256 + l);
}

int time_in_seconds() {
  return jiffy_time() / 60;
}

void reset_jiffy_time() {
  unsigned char *ptr=(unsigned char*)160;

  ptr[0]=0;
  ptr[1]=0;
  ptr[2]=0;
}

int main(int _argc, char **_argv) {
  int ii=1;

  reset_jiffy_time();

  while(jiffy_time() < 60) {
    ii++;
  }
  printf("%d\n", ii);

  ii = 0;
  reset_jiffy_time();

  while(JIFFY_TIME < 60) {
    ii++;
  }
  printf("%d\n", ii);


  ii = 0;
  reset_jiffy_time();

  while(JIFFY_SMALLS < 60) {
    ii++;
  }
  printf("%d\n", ii);

  ii = 0;
  reset_jiffy_time();

  while(JIFFY_LOW_BYTE < 60) {
    ii++;
  }
  printf("%d\n", ii);

  return EXIT_SUCCESS;
  //return 0;
}

