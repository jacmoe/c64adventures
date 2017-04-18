10 rem machine code demo
20 rem print 'a' on the screen
30 code = 828 : rem place code in the tape buffer (828-1020)($033c-$03fc)
40 for loop = 0 to 5
50      read byte
60      poke code + loop,byte
70 next loop
90 rem machine code data - 6 bytes
100 data 169,65 :       rem $a9, $41        - lda #asc"a"
110 data 32,210,255 :   rem $20, $d2, $ff   - jsr 65490
120 data 96 :           rem $60             - rts
140 rem execute machine code
150 sys 828