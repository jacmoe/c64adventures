10 rem save fac#1
20 code = 49152
30 for loop = 0 to 10
40      read byte
50      poke loop + code,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,6           : rem $a2,$06           - ldx #6
100                       rem again
110 data 181,96         : rem $b5,$60           - lda $60,x
120 data 157,52,3       : rem $9d,$34,$03       - sta $0334,x
130 data 202            : rem $ca               - dex
140 data 208,248        : rem $d0,$f8           - bne again
150 data 96             : rem $60               - rts
160 rem
170 print chr$(147)
180 poke 785,0          : rem set usradd pointing
190 poke 786,192        : rem to 49152 ($c000)
200 b = 837             : rem value to pass to fac#1
210 a = usr(b)          : rem pass and execute code
220 print "a = ";a
230 print "fac#1 = ";
240 for x = 1  to 6
250     print peek(820 + x);" ";
260 next x