10 rem place m/c above memsiz
20 rem reset memsiz to 40447
30 rem which is $9dff
35 rem and 512 bytes (40959 - 512 = 40447)
40 poke 55,255          : rem low byte (40447 - (157 * 256))
50 poke 56,157          : rem high byte (40447 / 256)
60 clr                  : rem clear stack
70 code = 40448         : rem set pc
80 for loop = 0 to 5
90      read byte
100     poke code + loop,byte
110 next loop
120 rem
130 rem m/c data
140 data 169,147        : rem $a9,$93           - lda #$93
150 data 32,210,255     : rem $20,$d2,$ff       - jsr 65490
160 data 96             : rem $60               - rts
170 rem
180 sys code
190 rem
200 rem basic programs are stored in the user ram
210 rem which stretches from 2048 ($0800) to 40959 ($9fff)
220 rem a massive 38k
230 rem memsiz is a label associated with locations 55 ($0037)
240 rem and 56 ($0038) which holds the address of the highest
250 rem memory location that may be used by a basic program
260 rem by moving memsiz, we can create space above the basic user ram.