10 goto 1000
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
600 gt=abs(nx-lx)
610 if abs(ny-ly)>gt then gt=abs(ny-ly)
620 xinc=(nx-lx)/gt : yinc=(ny-ly)/gt
630 xx=lx+0.5 : yy=ly+0.5
640 for cc=1 to gt
650 lx=int(xx) : ly=int(yy) : gosub 400
660 xx=xx+xinc : yy=yy+yinc
670 next cc : lx=nx : ly=ny : return
1000 poke 53280,0 : gosub 100
1010 col=208 : gosub 200
1020 pen=0 : lx=0 : ly=0
1030 read nx,ny
1040 if nx>1 then 1090
1050 if ny=1 then pen=1 : goto 1030
1060 if ny=0 then pen=0 : goto 1030
1070 if ny=2 then 1070
1080 col=-ny : goto 1030
1090 if pen=0 then lx=nx : ly=ny : goto 1030
1100 gosub 600 : goto 1030
1200 data -1,0,49,123,-1,1,74,102,73,112,78,112,81,98,74,102,88,94,212,78
1210 data 207,85,254,4,266,2,256,82,207,85,-1,0,258,72,-1,1
1220 data 272,70,286,98,250,137,236,108,272,70
1230 data 258,72,272,62,304,60,280,86,-1,0,245,125,-1,1
1240 data 90,130,136,156,145,192,173,195,245,125
1250 data -1,0,236,108,-1,1,158,114,-1,0,106,140,-1,1,78,140,49,134,49,123
1260 data -1,0,250,137,-1,1,233,137
1360 data -1.2