10 rem subroutine demo
15 rem prints input + 1 value higher, i.e. 'a' prints as 'b'
20 code = 49152
30 for loop = 0 to 14
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90                        rem wait
100 data 32,228,255     : rem $20,$e4,$ff       - jsr $ffe4     ; call getin subroutine
110 data 240,251        : rem $f0,$fb           - beq wait      ; if zero flag jump back to getin
120 data 133,251        : rem $85,$fb           - sta $fb       ; store key code in location $fb
130 data 230,251        : rem $e6,$fb           - inc $fb       ; increment $fb
140 data 165,251        : rem $a5,$fb           - lda $fb       ; load accumulator with value in $fb
150 data 32,210,255     : rem $20,$d2,$ff       - jsr $ffd2     ; call chrout subroutine
160 data 96             : rem $60               - rts           ; back to basic
170 rem
180 sys code