high8563addrreg = $12
grph8563reg = $19 ; graphics register
data8563reg = $31; vic data register
highbit = $80 ; bit 7 high to signal graphics mode
lowvicbmpvar = $fa ; may be poorly named because... data
highvicbmpvar = $fb
lowbyte8563var = $fc
highbyte8563var = $fd
vicstarthighbyte = $20

; need to move from $1800... it's "reserved for key functions" per
; Jim Butterfield's book on Machine Language Programming
*=$1800
jsr clrbmp ; jump to clearing subroutine
ldx #grph8563reg
lda #highbit
jsr writeato8563regx
lda #vicstarthighbyte
sta highvicbmpvar
lda #$00
sta lowvicbmpvar
ldx #high8563addrreg
jsr writeato8563regx
inx ; vic low address register now
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
jsr writeato8563ram
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
jsr writeato8563ram
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
jsr writeato8563ram
jsr $188f
jsr $18a9
dec $9b
bne $1823
brk
brk
writeato8563ram  ldx #$1f
writeato8563regx stx $d600
                 bit $d600
                 bpl $187a
                 sta $d601
                 rts
clc ; clear carry flag
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
clrbmp  lda #$00
        sta $fc
        lda #$3f
        sta $fd
        ldx #grph8563reg
        lda #highbit
        jsr writeato8563regx
        nop
        nop
        lda #$00
        ldx #high8563addrreg
        jsr writeato8563regx
        inx
        nop
        nop
        jsr writeato8563regx
        lda #$00
        jsr $1875
        dec $fc
        bne $18d1
        dec $fd
        bne $18d1
        rts