10 s=54272 : poke s+24,15
15 rem channel 1 - envelope shape: attack/decay, sustain/release
20 poke s+5,0 : poke s+6,240
25 rem channel 2 - envelope shape: attack/decay, sustain/release
30 poke s+12,0 : poke s+13,240
35 rem channel 3 - envelope shape: attack/decay, sustain/release
40 poke s+19,0 : poke s+20,240
45 rem turn all channels on: waveform + 1
50 poke s+4,33 : poke s+11,33 : poke s+18,33
60 read c
70 if c=0 then read d : for t=1 to d : next t : goto 60
80 if c<0 then 120
90 read l,h
100 poke s+(c*7)-7,l : poke s+(c*7)-6,h
110 goto 50
115 rem turn all channels off
120 poke s+4,32 : poke s+11,32 : poke s+18,32 : end
130 data 1,209,18,2,210,15,3,143,12
140 data 0,160,2,24,14,3,218,11,0,80
150 data 3,143,10,0,80,1,30,21,2,24,14,3,48,11,3,104,9
160 data 0,80,3,225,8,0,80,1,180,23
170 data 3,233,7,0,80,3,12,7,0,80
180 data 1,30,21,2,210,15,3,71,6,0,160
190 data 2,194,17,3,12,7,0,80
200 data 1,209,18,0,80,1,218,11,2,24,14
210 data 3,104,9,0,320
220 data -1