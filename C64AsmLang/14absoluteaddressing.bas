10 rem absolute addressing
20 code = 49152
30 for loop = 0 to 8
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 169,1           : rem $a9,$01           - lda #$01
100 data 141,80,04      : rem $8d,$50,$04       - sta 1104      ; store a into screen memory
110 data 141,80,216     : rem $8d,$50,$d8       - sta 55376     ; store white code into colour memory
120 data 96             : rem $60               - rts
130 rem
140 print chr$(147)
150 print : print : print
160 sys code