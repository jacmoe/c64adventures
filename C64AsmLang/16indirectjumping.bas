10 rem indirect jumping
20 code = 49152
30 for loop = 0 to 15
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 169,00          : rem $a9,$00           - lda #$00      ; load a with low byte of $c000
100 data 133,251        : rem $85,$fb           - sta $fb       ; store in $fb
110 data 169,192        : rem $a9,$c0           - lda #$c0      ; load a with high byte of $c000
120 data 133,252        : rem $85,$fc           - sta $fc       ; store in $fc
130 data 169,42         : rem $a9,$2a           - lda #asc"*"   ; load ascii value of star into a
140 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print star to the screen
150 data 108,251,0      : rem $6c,$fb,$00       - jmp ($fb)     ; jump to $c000
160 rem
170 sys code