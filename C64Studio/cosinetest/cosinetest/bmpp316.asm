grphreg = $19 ; graphics register
highbit = $80 ; bit 7 high to signal graphics mode
*=$1800
jsr clrbmp ; jump to clearing subroutine
ldx #grphreg
lda #highbit
jsr writeato8563regx
lda #$20
sta $fb
lda #$00
sta $fa
ldx #$12
jsr writeato8563regx
inx 
jsr writeato8563regx
lda #$00
sta $b1
lda #$19
sta $9b
lda #$07
sta $9c
lda #$27
sta $fe
nop
nop
ldx #$00
lda ($fa,x)
jsr $1875
jsr $1883
nop
nop
nop
dec $fe
bne $182d
lda $b1
bne $185e
nop
nop
nop
ldx #$00
lda ($fa,x)
jsr $1875
jsr $188f
jsr $189b
dec $9c
bne $1827
lda #$01
sta $b1
jmp $1827
nop
ldx #$00
sta $b1
ldx #$00
lda ($fa,x)
jsr $1875
jsr $188f
jsr $18a9
dec $9b
bne $1823
brk
brk
ldx #$1f
writeato8563regx stx $d600
                 bit $d600
                 bpl $187a
                 sta $d601
                 rts
clc
lda $fa
adc #$08
sta $fa
bcc $188e
inc $fb
rts
ldy #$28
lda #$00
jsr $1875
dey
bne $1891
rts
nop
sec
lda $fb
sbc #$01
sta $fb
lda $fa
sbc #$37
sta $fa
rts
inc $fa
bne $18af
inc $fb
rts
nop
nop
nop
clrbmp lda #$00
sta $fc
lda #$3f
sta $fd
ldx #$19
lda #$80
jsr $1877
nop
nop
lda #$00
ldx #$12
jsr $1877
inx
nop
nop
jsr $1877
lda #$00
jsr $1875
dec $fc
bne $18d1
dec $fd
bne $18d1
rts