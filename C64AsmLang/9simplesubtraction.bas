10 rem simple subtraction
20 code = 49152
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 56              : rem $38               - sec           ; set carry flag
100 data 165,251        : rem $a5,$fb           - lda $fb
110 data 229,252        : rem $e5,$fc           - sbc $fc       ; subtract, borrowing carry
120 data 133,253        : rem $85,$fd           - sta $fd
130 data 96             : rem $60               - rts
140 rem
150 print chr$(147)
160 input "highest number";a
170 input "lowest number";b
180 poke 251,a : poke 252,b
190 sys code
200 print "answer is";
210 print peek(253)