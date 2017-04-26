5 rem enterprise as a sprite
10 code = 49152
20 for loop = 0 to 26
25      read byte
30      poke code + loop,byte
35 next loop
40 rem m/c data for sprite control
42 data 169,147         : rem $a9,$93           - lda #$93      ; load 147 into a
44 data 32,210,255      : rem $20,$d2,$ff       - jsr print     ; clear screen
46 data 169,13          : rem $a9,$0d           - lda #13
48 data 141,250,7       : rem $8d,$fa,$07       - sta 2042      ; poke 2042,13 - data in block 13
50 data 169,4           : rem $a9,$04           - lda #4
52 data 141,21,208      : rem $8d,$15,$d0       - sta 53269     ; poke 53269,4 - enable sprite 2
54 data 141,29,208      : rem $8d,$1d,$d0       - sta 53277     ; poke 53277,4 - expand in x direction
56 data 169,130         : rem $a9,$82           - lda #130
58 data 141,4,208       : rem $8d,$04,$d0       - sta 53252     ; poke 53252,130 - x coordinate
60 data 141,5,208       : rem $8d,$05,$d0       - sta 53253     ; poke 53253 - y coordinate
70 data 96              : rem $60               - rts
80 rem
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
300 sys code