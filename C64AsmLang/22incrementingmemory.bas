10 rem incrementing memory
20 code = 49152
30 for loop = 0  to 6
40      read byte
50      poke code + loop,byte
60 next loop
70 rem
80 rem m/c data
90 data 230,251         : rem $e6,$fb           - inc $fb       ; low byte of counter at $fb incremented
100 data 208,2          : rem $d0,$02           - bne over      ; if zero flag is set, branch (when low byte changes from $ff to $00)
110 data 230,252        : rem $e6,$fc           - inc $fc       ; increment high byte of counter
120                       rem over
130 data 96             : rem $60               - rts
140 rem
150 poke 251,0 : poke 252,0
160 sys code
170 low = peek(251)
180 high = peek(252)
190 num = high * 256 + low
200 print num
210 goto 160