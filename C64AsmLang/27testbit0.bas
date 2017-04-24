10 rem test bit 0
20 code = 49152
30 for loop = 0 to 10
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 165,251         : rem $a5,$fb           - lda $fb       ; load accumulator with the value in location 251 ($fb)
100 data 74             : rem $4a               - lsr a         ; shift bits left
110 data 169,48         : rem $a9,$30           - lda #asc"0"   ; load ascii 0 into accumulator
120 data 105,0          : rem $69,$00           - adc #0        ; add 1 to a if carry flag is set
130 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print to screen
140 data 96             : rem $60               - rts
150 rem
160 input a
170 poke 251,a
180 sys code
