10 rem place m/c in free ram
20 rem from 49152 ($c000) onwards ( to $cfff) - 4096 bytes
30 code = 49152
40 for loop = 0 to 5
50      read byte
60      poke code + loop,byte
70 next loop
80 rem
90 rem m/c data
100 data 169,14         : rem $a9,$0e           - lda #$0e
110 data 32,210,255     : rem $20,$d2,$ff       - jsr 65490
120 data 96             : rem $60               - rts
130 rem
140 sys code
150 rem
160 rem to get back to upper case, substitute 142 (8e) for 14 in line 100