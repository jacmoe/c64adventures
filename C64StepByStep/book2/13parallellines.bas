10 gosub 100
20 col=18 : gosub 200
30 for ly=80 to 120 step 10
40 for lx=100 to 220
50 gosub 400
60 next lx
70 next ly
80 end
100 rem tell VIC chip to use high-resolution mode
110 poke 53272,peek(53272) or 8
120 poke 53265,peek(53265) or 32
130 return
200 data 0,165,252,197,254,208,7,165
210 data 251,197,253,208,1,96,160,0
220 data 173,80,195,145,251,230,251
230 data 208,232,230,252,76,81,195
235 rem clears 8000 bytes for graphics
237 rem and 1000 bytes for diplay codes
240 restore : for c=50000 to 50029
250 read byte : poke c,byte : next c
260 poke 251,0 : poke 252,4 : poke 253,232
270 poke 254,7 : poke 50000,col : sys 50001
280 poke 251,0 : poke 252,32 : poke 253,64
290 poke 254,63 : poke 50000,0 : sys 50001 : return
300 byte=8192+int(ly/8)*320+int(lx/8)*8+(ly and 7)
310 mask=2^(7-(lx and 7))
320 return
400 gosub 300
410 poke byte,peek(byte) or mask
420 cmem=1024+int(ly/8)*40+int(lx/8)
430 poke cmem,col
440 return
500 gosub 300
520 poke byte,peek(byte) and (255-mask)
530 return