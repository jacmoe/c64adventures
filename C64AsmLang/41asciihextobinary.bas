10 rem ascii hex to binary
20 code = 49152
30 for loop = 0 to 48
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 32,34,192       : rem $20,$22,$c0       - jsr character
100 data 165,252        : rem $a6,$fc           - lda $fc
110 data 32,24,192      : rem $20,$18,$c0       - jsr check
120 data 10             : rem $0a               - asl a
130 data 10             : rem $0a               - asl a
140 data 10             : rem $0a               - asl a
150 data 10             : rem $0a               - asl a
160 data 133,253        : rem $85,$fd           - sta $fd
170 data 165,251        : rem $a5,$fb           - lda $fb
180 data 32,24,192      : rem $20,$18,$c0       - jsr check
190 data 5,253          : rem $05,$fd           - ora $fd
200 data 133,254        : rem $85,$fe           - sta $fd
210 data 96             : rem $60               - rts
220 rem check subroutine : $c018
230 data 201,58         : rem $c9,$3a           - cmp #$3a
240 data 176,3          : rem $b0,$03           - bcs atof
250 data 41,15          : rem $29,$0f           - and #$0f
260 data 96             : rem $60               - rts
270                       rem atof
280 data 233,55         : rem $e9,$37           - sbc #$37
290 data 96             : rem $60               - rts
300 rem character subroutine : $c022
310                       rem first
320 data 32,228,255     : rem $20,$e4,$ff       - jsr $ffe4
330 data 240,251        : rem $f0,$fb           - beq first
340 data 133,252        : rem $85,$fc           - sta $fc
350                       rem second
360 data 32,228,255     : rem $20,$e4,$ff       - jsr $ffe4
370 data 240,251        : rem $f0,$fb           - beq second
380 data 133,251        : rem $85,$fb           - sta $fb
390 data 96             : rem $60               - rts
400 rem
410 print chr$(147)
420 print "enter two hex digits";
430 sys code
440 print : print "their binary value is: ";
450 print peek(254)