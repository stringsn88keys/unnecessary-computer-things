01800 8e 00 d6  stx $d600
01803 2c 00 d6  bit $d600
01806 10 fb     bpl $1803
01808 ad 01 d6  lda $d601
0180b 60        rts

0180c 8e 00 d6  stx $d600
0180f 2c 00 d6  bit $d600
01812 10 fb     bpl $180f
01814 8d 01 d6  sta $d601
01817 60        rts