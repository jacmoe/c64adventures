10 rem absolute indexed addressing
20 code = 49152
30 for loop = 0 to 21
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,32          : rem $a2,$20           - ldx #$20
100 data 189,0,4        : rem $bd,$00,$04       - lda 1024,x
110 data 157,8,6        : rem $9d,$08,$06       - sta 1544,x
120 data 202            : rem $ca               - dex
130 data 208,247        : rem $d0,$f7           - bne -9
140 data 169,1          : rem $a9,$01           - lda #$01
150 data 162,32         : rem $a2,$20           - ldx #$20
160 data 157,8,218      : rem $9d,$08,$da       - sta 55816
170 data 202            : rem $ca               - dex
180 data 208,250        : rem $d0,$fa           - bne -5
190 data 96             : rem $60               - rts
200 rem
210 print chr$(147)
220 print "absolute indexed addressing"
230 get a$
240 if a$ = "" then goto 230
250 sys code