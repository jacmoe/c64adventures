10 rem rvs on using pokes
20 rem place m/c in tape buffer
30 poke 828,169         : rem $a9               - lda #'rvs on'
40 poke 829,18          : rem $12
50 poke 830,32          : rem $20               - jsr  61898
60 poke 831,202         : rem $ca
70 poke 832,241         : rem $f1
72 poke 833,169         : rem $a9               - lda #$41
74 poke 834,65          : rem $41
76 poke 835,32          : rem $32               - jsr 65490
78 poke 836,210         : rem $d2
80 poke 837,255         : rem $ff
82 poke 840,96          : rem $60               - rts
90 sys 828