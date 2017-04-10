5 let v=53248 : rem VIC chip address
10 poke 53280,6 : poke 53281,2
20 print chr$(147)
30 for c=0 to 63
40 read byte
50 poke 832+c, byte : rem poke sprite data into memory, 13th 64bit page
60 next c
70 poke 2040,13 : rem tell VIC to use page 13
80 poke v+39,1 : rem set sprite 0 color to white
85 rem set x position, y position, extra bit in v+16 (bit zero)
90 poke v,50 : poke v+1,100 : poke v+16,0
100 poke v+21,1 : rem turn sprite 0 on
105 rem horizontal expansion, vertical expansion
110 poke v+23,1 : poke v+29,1
1000 REM 
1010 DATA 15,248,0
1020 DATA 1,192,0
1030 DATA 1,96,0
1040 DATA 1,240,0
1050 DATA 1,28,0
1060 DATA 241,254,0
1070 DATA 97,193,0
1080 DATA 114,31,224
1090 DATA 127,252,96
1100 DATA 255,254,56
1110 DATA 198,3,47
1120 DATA 255,254,56
1130 DATA 127,252,96
1140 DATA 114,31,224
1150 DATA 97,193,0
1160 DATA 241,254,0
1170 DATA 1,28,0
1180 DATA 1,240,0
1190 DATA 1,96,0
1200 DATA 1,192,0
1210 DATA 15,248,0,0
