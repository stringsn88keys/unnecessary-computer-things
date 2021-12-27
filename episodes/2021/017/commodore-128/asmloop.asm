;startup address
  * = $0c00
;create BASIC startup
ASMSTART
  ldx #$00
  ldy #$00
  lda #$00
  sta $a0
  sta $a1
  sta $a2
  sta HIBYTE
  sta MIDBYTE
  sta LOBYTE
  lda #$3c
.loop
  inx
  ;inc LOBYTE
  bne .nocarry
  iny
  ;inc MIDBYTE
  bne .nocarry
  inc HIBYTE
.nocarry
  cmp $a2
  bcs .loop
  stx LOBYTE
  sty MIDBYTE
  rts
HIBYTE
  !byte $00
MIDBYTE
  !byte $00
LOBYTE
  !byte $00