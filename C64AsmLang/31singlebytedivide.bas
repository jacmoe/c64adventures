10 rem single byte divide
20 code = 49152
30 for loop = 0 to 20
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,8           : rem $a2,$08   - ldx #$08      ; load 8 into x register, representing number of bits to be shifted
100 data 169,0          : rem $a9,$00   - lda #$00      ; clear accumulator
110                       rem again                     ; set loop
120 data 6,251          : rem $06,$fb   - asl $fb       ; shift the dividend left
130 data 42             : rem $2a       - rol a         ; shift dividend left
140 data 197,252        : rem $c5,$fc   - cmp $fc       ; divisor and partial dividend compared
150 data 144,4          : rem $90,$04   - bcc over      ; if result = divisor less than or equal to partial dividend..
160 data 229,252        : rem $e5,$fc   - sbc $fc       ; divisor is subtracted from partial dividend
170 data 230,251        : rem $e6,$fb   - inc $fb       ; 1 added to quotient
180                       rem over                      ; skipped if divisor is greater than partial dividend
190 data 202            : rem $ca       - dex           ; bit count decremented
200 data 208,242        : rem $d0,$f2   - bne again     ; control returned to 'again' if not complete
210 data 133,253        : rem $85,$fd   - sta $fd       ; any remainder saved in $fd
220 data 96             : rem $60       - rts
230 rem
240 print
250 input "dividend";a
260 input "divisor";b
270 poke 251,a : poke 252,b
280 sys code
290 print "result = ";
300 print peek(251)
310 print "remainder = ";
320 print peek(253)