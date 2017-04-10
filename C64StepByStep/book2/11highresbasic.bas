1 rem Clears memory and prepares high res graphics
2 rem First, we need to move the BASIC storage area:
3 rem 1) poke 642,64
4 rem 2) poke 44,64
5 rem 3) poke 16384,0
6 rem 4) new
7 rem this must be performed manually
8 rem Not sure if this is needed in VICE ..
10 gosub 100
20 col=18 : gosub 200
30 end
100 rem tell VIC chip to use high-resolution mode
110 poke 53272,peek(53272) or 8
120 poke 53265,peek(53265) or 32
130 return
200 rem clear all 8000 bytes for graphics
210 for mem=8192 to 16191
220 poke mem,0 : next mem
230 rem clear 1000 bytes for display codes
240 for mem=1024 to 2023
250 poke mem,col : next mem
260 return