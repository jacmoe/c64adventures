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
