10 rem multiply by four
20 code = 49152
30 for loop = 0 to 6
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 165,251         : rem $a5,$fb   - lda $fb       ; loads number into accumulator
100 data 10             : rem $0a       - asl a         ; shift accumulator left (arithmetic shift left)
110 data 10             : rem $0a       - asl a         ; shift accumulator left
120 data 133,251        : rem $85,$fb   - sta $fb       ; stores result in $fb
130 data 96             : rem $60       - rts
140 rem
150 print chr$(147)
160 input "number to be multiplied by four";num
170 poke 251,num
180 print "x 4 =";
190 sys code
200 print peek(251)
210 rem
220 rem every time the accumulator gets shifted left, it gets multiplied by 2