10 rem decrementing memory
20 code = 49152
30 for loop = 0 to 8
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 165,251         : rem $a5,$fb   - lda $fb       ; load low byte of counter into accumulator
100 data 208,2          : rem $d0,$02   - bne lsbdec    ; check zero flag
110 data 198,252        : rem $c6,$fc   - dec $fc       ; if set, high byte need decrementing
120                       rem lsbdec
130 data 198,252        : rem $c6,$fb   - dec $fb       ; decrement low byte of counter
140 data 96             : rem $60       - rts
150 rem
160 poke 251,0 : poke 252,0
170 sys code
180 low = peek(251)
190 high = peek(252)
200 num = high * 256 + low
210 print num
220 goto 170