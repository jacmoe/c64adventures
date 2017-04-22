10 rem jumping
20 code = 49152
30 for loop = 0 to 7
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90                        rem start
100 data 169,42         : rem $a9,$2a           - lda #asc"*"   ; load accumulator with ascii *
110 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; call chrout subroutine
120 data 76,0,192       : rem $4c,$00,$c0       - jmp start     ; jump back to start
130 rem
140 sys code