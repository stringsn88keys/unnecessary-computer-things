* = $01800
stx $d600
bit $d600
bpl $1803
lda $d601
rts

stx $d600
bit $d600
bpl $180f
sta $d601
rts