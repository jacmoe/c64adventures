10 rem conditional assembly
20 code = 49152
30 print chr$(147)
40 print spc(8)
50 print "conditional assembly"
60 print "press 1 to assemble mbadd"
70 print "      2 to assemble mbsub"
80 get a$
90 a = val(a$)
100 if a = 1 then goto 200
110 if a = 2 then goto 300
120 goto 80
130 rem
190 rem assemble mbadd
200 restore
210 for loop = 0 to 18
220     read byte
230     poke code + loop,byte
240 next loop
250 end
260 rem
290 rem assemble mbsub
300 restore
310 read byte
320 if byte <> 96 then goto 310
330 goto 210
340 rem
350 rem mbadd data
360 data 164,251        : rem $a4,$fb           - ldy $fb       ; 
370 data 162,0          : rem $a2,$00           - ldx #$00      ; 
380 data 24             : rem $18               - clc           ; 
390                       rem again
400 data 189,0,21       : rem $bd,$00,$15       - lda $1500,x   ; 
410 data 125,0,22       : rem $7d,$00,$16       - adc $1600,x   ; 
420 data 157,0,21       : rem $9d,$00,$15       - sta $1500,x   ; 
430 data 232            : rem $e8               - inx           ; 
440 data 136            : rem $88               - dey           ; 
450 data 208,243        : rem $d0,$f3           - bne again     ; 
460 data 96             : rem $60               - rts
470 rem
480 rem mbsub data
490 data 164,251        : rem $a4,$fb           - lda $fb       ; 
500 data 162,0          : rem $a2,$00           - ldx #$00      ; 
510 data 56             : rem $38               - sec           ; 
520                       rem again
530 data 189,0,23       : rem $bd,$00,$17       - lda $1700,x   ; 
540 data 253,0,24       : rem $fd,$00,$18       - sbc $1800,x   ; 
550 data 157,0,23       : rem $9d,$00,$17       - sta $1700,x   ; 
560 data 232            : rem $e8               - inx           ; 
570 data 136            : rem $88               - dey           ; 
580 data 208,243        : rem $d0,$f3           - bne again     ; 
590 data 96             : rem $60               - rts