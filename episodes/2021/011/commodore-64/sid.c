#include <stdio.h>
#include <stdlib.h>
#include <c64.h>


// /opt/homebrew/Cellar/cc65/2.19/share/cc65/include
#define SID2     (*(struct __sid*)0xDE00)
#define SID3     (*(struct __sid*)0xDF00)
const unsigned int scale[] = {
  268,284,301,318,337,358,379,401,425,451,477,506,
  536,568,602,637,675,716,758,803,851,902,955,1012,
  1072,1136,1204,1275,1351,1432,1517,1607,1703,1804,1911,2025,
  2145,2273,2408,2551,2703,2864,3034,3215,3406,3608,3823,4050,
  4291,4547,4817,5103,5407,5728,6069,6430,6812,7217,7647,8101,
  8583,9094,9634,10207,10814,11457,12139,12860,13625,14435,15294,16203,
  17167,18188,19269,20415,21629,22915,24278,25721,27251,28871,30588,32407,
  34334U,36376U,38539U,40833U,43258U,45830U,48556U,51443U,54502U,57743U,61176U,64814U
};
int scale_size = sizeof(scale) / sizeof(int);
int main (void) {
	unsigned int i;
	unsigned char t;

	SID.amp      = 0x1F; 	// Volume
  SID2.amp      = 0x1F; 	// Volume
  SID3.amp      = 0x1F; 	// Volume
	SID.v1.ad    = 0x09; 	// Attack/decay voice 1
  SID.v2.ad    = 0x09;
  SID.v3.ad    = 0x09;
  SID2.v1.ad   = 0x09;
  SID2.v2.ad   = 0x09;
  SID2.v3.ad   = 0x09;
  SID3.v1.ad   = 0x09;
  SID3.v2.ad   = 0x09;
  SID3.v3.ad   = 0x09;

	for (t = 0 ; t < scale_size; t++) {

		SID.v1.freq  = scale[t];	// Frequency
		SID.v1.ctrl  = 0x11;	// Control voice 1
    SID.v2.freq  = scale[(t+7)%scale_size];
    SID.v2.ctrl  = 0x11;	// Control voice 1
    SID.v3.freq  = scale[(t+12)%scale_size];
    SID.v3.ctrl  = 0x11;	// Control voice 1
		SID2.v1.freq  = scale[(t+16)%scale_size];	// Frequency
		SID2.v1.ctrl  = 0x11;	// Control voice 1
    SID2.v2.freq  = scale[(t+19)%scale_size];
    SID2.v2.ctrl  = 0x11;	// Control voice 1
    SID2.v3.freq  = scale[(t+24)%scale_size];
    SID2.v3.ctrl  = 0x11;	// Control voice 1
    SID3.v1.freq  = scale[(t+22)%scale_size];
    SID3.v1.ctrl  = 0x11;	// Control voice 1
    SID3.v2.freq  = scale[(t+26)%scale_size];
    SID3.v2.ctrl  = 0x11;	// Control voice 1
    SID3.v3.freq  = scale[(t-12)%scale_size];
    SID3.v3.ctrl  = 0x11;	// Control voice 1
		for (i = 0 ; i < 1000; i++) {}
		SID.v1.ctrl  = 0x10;
    SID.v2.ctrl  = 0x10;
    SID.v3.ctrl  = 0x10;
    SID2.v1.ctrl  = 0x10;
    SID2.v2.ctrl  = 0x10;
    SID2.v3.ctrl  = 0x10;
    SID3.v1.ctrl  = 0x10;
    SID3.v2.ctrl  = 0x10;
    SID3.v3.ctrl  = 0x10;
		for (i = 0 ; i < 1000 ; i++) {}
	}
	return EXIT_SUCCESS;
}
