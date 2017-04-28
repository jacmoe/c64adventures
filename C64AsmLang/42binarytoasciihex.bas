10 rem print accumulator as hex number
20 code = 49152
30 for loop = 0 to 21
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 72              : rem $48               - pha
100 data 74             : rem $4a               - lsr a
110 data 74             : rem $4a               - lsr a
120 data 74             : rem $4a               - lsr a
130 data 74             : rem $4a               - lsr a
140 data 32,9,192       : rem $20,$09,$c0       - jsr first
150 data 104            : rem $68               - pla
160 rem first subroutine : $c009
170 data 41,15          : rem $29,$0f           - and #$0f
180 data 201,10         : rem $c9,$0a           - cmp #$0a
190 data 144,2          : rem $90,$02           - bcc over
200 data 105,6          : rem $69,$06           - adc #$06
210                       rem over
220 data 105,48         : rem $69,$30           - adc #$30
230 data 76,210,255     : rem $4c,$d2,$ff       - jmp $ffd2
240 rem
250 rem demo program
260 rem lda $fb : jmp $c000
270 poke 828,165 : poke 829,251
280 poke 830,76 : poke 831,0 : poke 832,192
290 print chr$(147)
300 print "hit a key and its hex value in "
310 print "ascii will be displayed"
320 get a$
330 if a$ = "" then goto 320
340 a = asc(a$)
350 poke 251,a
360 rem call link routine - lines 270 and 280
370 sys 828
380 rem call 'sys code' to use directly