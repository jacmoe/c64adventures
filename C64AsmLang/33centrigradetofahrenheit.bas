10 rem centigrade to fahrenheit
15 rem uses lookup table
20 code = 49152
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 166,251      : rem $a9,$fb           - ldx $fb          ; put input value into x register
100 data 189,0,193   : rem $bd,$00,$c1       - lda $c100,x      ; get value by indexing into lookup table
110 data 133,252     : rem $85,$fc           - sta $fc          ; store value in location 252
120 data 96          : rem $60               - rts
130 rem
140 rem calculate table values
150 for c = 0 to 100
160     f = (1.8 * c) + 32
170     poke 49408 + c,f        : rem $c100
180 next c
190 rem
200 print chr$(147)
210 input "centigrade value";c
220 poke 251,c
230 sys code
240 print "fahrenheit value";
250 print peek(252)