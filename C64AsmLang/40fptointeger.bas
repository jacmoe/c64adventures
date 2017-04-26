10 rem fp to integer
20 code = 49152
30 for loop = 0 to 17
40      read byte
50      poke loop + code,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,6           : rem $a2,$06           - ldx #6
100                       rem again
110 data 189,52,3       : rem $bd,$34,$03       - lda 820,x
120 data 149,96         : rem $95,$60           - sta $60,x
130 data 202            : rem $ca               - dex
140 data 208,248        : rem $d0,$f8           - bne again
150 data 32,170,177     : rem $20,$aa,$b1       - jsr $b1aa     ; convert fac to integer in a and y
160 data 133,251        : rem $85,$fb           - sta $fb
170 data 132,252        : rem $84,$fc           - sty $fc
180 data 96             : rem $60               - rts
190 rem
200 for x = 0 to 5
210     read fac
220     poke 821 + x,fac
230 next x
235 rem
240 rem fac data
250 data 137,145,128,0,0,0
260 print chr$(147)
270 sys code
280 print "results returned are:"
290 print "accumulator = "; peek(251)
300 print "y register = "; peek(252)
310 rem
320 rem accumulator = 1         ($01)
330 rem y register = 35         ($23)