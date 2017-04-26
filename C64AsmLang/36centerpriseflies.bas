5 rem the enterprise flies
8 rem a keypress will cause the wessel to move forward
10 code = 49152
20 for loop = 0 to 41
25      read byte
30      poke code + loop,byte
35 next loop
40 rem m/c data for final sprite
42 data 169,147         : rem $a9,$93           - lda #$93
44 data 32,210,255      : rem $20,$d2,$ff       - jsr $ffd2
46 data 169,13          : rem $a9,$0d           - lda #13
48 data 141,250,7       : rem $8d,$fa,$07       - sta 2042
50 data 169,4           : rem $a9,$04           - lda #4
52 data 141,21,208      : rem $8d,$15,$d0       - sta 53269
54 data 141,29,208      : rem $8d,$1d,$d0       - sta 53277
56 data 169,100         : rem $a9,$64           - lda #100
58 data 141,5,208       : rem $8d,$05,$d0       - sta 53253
60 data 162,0           : rem $a2,$00           - ldx #00
62                        rem again
64 data 138             : rem $8a               - txa
66 data 141,4,208       : rem $8d,$04,$d0       - sta 53252
68 data 134,251         : rem $86,$fb           - stx $fb
70                        rem wait
72 data 32,228,255      : rem $20,$e4,$ff       - jsr $ffe4
74 data 240,251         : rem $f0,$fb           - beq wait
76 data 166,251         : rem $a6,$fb           - ldx $fb
78 data 232             : rem $e8               - inx
80 data 208,240         : rem $d0,$f0           - bne again
82 data 96              : rem $60               - rts
86 rem
90 rem sprite data
100 for n = 0 to 62
110     read byte
120     poke 832 + n,byte
130 next
200 data 0,0,0
201 data 127,254,0
202 data 127,254,0
203 data 63,254,0
204 data 63,254,0
205 data 1,128,0
206 data 1,128,120
207 data 1,131,254
208 data 1,131,254
209 data 1,129,128
210 data 1,131,128
211 data 1,131,128
212 data 1,131,128
213 data 1,143,0
214 data 1,143,0
215 data 1,140,0
216 data 15,254,0
217 data 3,255,0
218 data 3,255,0
219 data 1,254,0
220 data 0,0,0
225 rem
230 sys code