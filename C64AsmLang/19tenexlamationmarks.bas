10 rem 10 ! marks
20 code = 49152
30 for loop = 0 to 12
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 162,0           : rem $a2,$00           - ldx #0        ; init x register
100 data 169,33         : rem $a9,$21           - lda #asc"!"   ; place ascii code for ! in accumulator
110 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; print to screen
120 data 232            : rem $e8               - inx           ; increment x register
130 data 224,10         : rem $e0,$0a           - cpx #10       ; compare x register with 10
140 data 208,248        : rem $d0,$f8           - bne -8        ; bne opcode followed by a single byte, known as displacement (relative addressing)
150 data 96             : rem $60               - rts           ; back to basic
160 rem
170 sys code
172 rem
175 rem Calculate displacement:
180 rem loop
190 rem         jsr $ffd2       3 bytes
200 rem         inx             1 byte
210 rem         cpx #10         2 bytes
220 rem         bne loop        2 bytes
225 rem
230 rem  0 0 0 0 1 0 0 0         (8)
240 rem  1 1 1 1 0 1 1 1
250 rem +              1
260 rem -----------------------
270 rem  1 1 1 1 1 0 0 0        (-8 = $f8) ; two's complement value