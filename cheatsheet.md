--------------------------------------------------------
Processor Status Register

bits    7   6   5   4   3   2   1   0
flags   N   V   -   B   D   I   Z   C

N = negative
V = bit overflow
B = break
D = decimal mode
I = interrupt disable
Z = zero
C = carry

--------------------------------------------------------

Adressing Modes

Mode                    sample          machine-    bytes
.                       statement       code

Immediate               adc #$03        69 03       2
Zero Page               adc #$03        65 03       2
Zero Page,X             adc $03,x       75 03       2
Absolute                adc $0300       6d 00 03    3
Absolute Indexed,X      adc $0300,x     7d 00 03    3
Absolute Indexed,Y      adc $0300,y     79 00 03    3
Indexed Indirect        adc ($03,x)     61 03       2
Indirect Indexed        adc ($03),y     71 03       2


.   Adressing Mode          format
1   Implicit (implied)      rts
2   Accumulator             asl a
3   Immediate               lda #2
4   Absolute                lda $02a7
5   Zero Page               sta $fb
6   Relative                bcc label
7   Absolute Indexed,x      lda $02a7,x
8   Absolute Indexed,y      lda $02a7,y
9   Zero Page,x             lda $fb,x
10  Zero Page,y             stx $fb,y
11  Indexed Indirect        lda ($fd,x)
12  Indirect Indexed        lda ($fd),y
13  Unindexed Indirect      jmp


Zero-Page,X Adressing
Format: lda $fb,x
Instructions that can be used: adc, and,  asl, cmp, dec, eor, inc, lda, ldy, lsr, ora, rol, ror, sbc, sta, sty.

Zero-Page,Y Addressing
Format: stx $fb,y
Instructions that can be used: ldx, stx
This addressing mode exists because ldx and stx cannot be used with zero-page,x adressing mode.

Indirect Indexed Adressing
Format: lda ($fd),y
Indirect indexed addressing uses the y register, never the x register, as an offset to calculate the base address
of the start of the page.
It must use a page zero starting address but the table itself does not have to be.



LOGICAL
--------------------------------------------------------
AND

0 0 = 0
0 1 = 0
1 0 = 0
1 1 = 0

10010011
00000111
--------
00000011

AND can be used as a filter / mask, e.g. in the example above,
we are only interested in the last 3 bits.

--------------------------------------------------------

OR

0 0 = 0
0 1 = 1
1 0 = 1
1 1 = 1

10010011
00100111
--------
10110111

OR can be used to set specific bits.

--------------------------------------------------------

XOR (EOR)

0 0 = 0
0 1 = 1
1 0 = 1
1 1 = 0

10010011
00100111
--------
10110100

If the inputs are different, we get a 1 out, otherwise 0.

XOR can be used for many things, e.g. test where bits are different, i.e. for collision detection.

--------------------------------------------------------

NOT

6502 does not have an instruction for NOT, but we can XOR with $ff (EOR #$ff

0 1 = 1
0 1 = 1
1 1 = 0
1 1 = 0

10010011
11111111
--------
01101100
