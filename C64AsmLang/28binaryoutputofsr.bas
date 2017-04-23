10 rem binary output of sr
15 rem prints the bits in the status register
20 code = 49152
30 for loop = 0 to 18
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 8               : rem $08               - php           ; push the status register onto the stack
100 data 104            : rem $68               - pla           ; pull from the stack into the accumulator
110 data 133,251        : rem $85,$fb           - sta $fb       ; store a in location 251
120 data 162,8          : rem $a2,$08           - ldx #$08      ; init x register (8)
130                       rem nbit                              ; label marker for next bit
140 data 6,251          : rem $06,$fb           - asl $fb       ; arithmetic shift left location 251 (moves most significant bit into the carry flag)
150 data 169,48         : rem $a9,$30           - lda #asc"0"   ; load ascii 0 into a
160 data 105,0          : rem $69,$00           - adc #$00      ; add carry
170 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print to screen
180 data 202            : rem $ca               - dex           ; deincrement x register (bit counter)
190 data 208,244        : rem $d0,$f4           - bne nbit      ; branch to nbit if x has not reached zero
200 data 96             : rem $60               - rts
210 rem
220 print chr$(147)
230 print "nv-bdizc"
240 sys code