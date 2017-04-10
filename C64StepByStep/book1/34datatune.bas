300 s=54272 : poke s+24,15
310 poke s+5,0 : poke s+6,160
320 read l,h,d
330 if h=0 then for t=1 to 20 : next t : goto 320
340 if h<0 then end
350 poke s+0,l : poke s+1,h
360 poke s+4,33
370 for t=1 to d : next t
380 poke s+4,32
390 goto 320
400 data 195,16,160,0,0,0,195,16,80
410 data 209,18,320,30,21,320,0,-1,0