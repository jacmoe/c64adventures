10 rem indirect addressing
20 code = 49152
30 for loop = 0 to 19
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 160,39          : rem $a0,$27           - ldy #$27      ; y is set to text screen line length count
100 data 177,251        : rem $b1,$fb           - lda ($fb),y   ; byte stored at screentop + y is stored in a
110 data 145,253        : rem $91,$fd           - sta ($fd),y   ; stored in screen memory at location specified by screenbot + y
120 data 136            : rem $88               - dey           ; decrement y register
130 data 208,249        : rem $d0,$f9           - bne -7        ; 
140 data 162,39         : rem $a2,$27           - ldx #$27      ; 
150 data 169,1          : rem $a9,$01           - lda #$01      ; 
160 data 157,8,218      : rem $9d,$08,$da       - sta 55816,x   ; 
170 data 202            : rem $ca               - dex           ; 
180 data 208,250        : rem $d0,$fa           - bne -6        ; 
190 data 96             : rem $60               - rts           ; 
200 rem
210 poke 251,0 : poke 252,4 : rem screentop
220 poke 253,8 : poke 254,6 : rem screenbot
230 print chr$(147)
240 print "indirect indexed addressing"
250 get a$
260 if a$ = "" then goto 250
270 sys code