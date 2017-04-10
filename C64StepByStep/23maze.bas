10 poke 53280,8 : poke 53281,0 : print chr$(147);chr$(5) : print
20 for y=1 to 13 : for x=1 to 13
30 read m : print tab(12)
40 rem on var goto line, line, line works like this:
50 rem pick the goto that matches var
60 rem if m = 1 then goto 90
65 rem if m = 2 then goto 100
70 on m goto 90,100,110,120,130,140
80 on m-6 goto 150,160,170,180,190
90 print chr$(98); : goto 200
100 print chr$(99); : goto 200
110 print chr$(173); : goto 200
120 print chr$(176); : goto 200
130 print chr$(174); : goto 200
140 print chr$(189); : goto 200
150 print chr$(177); : goto 200
160 print chr$(171); : goto 200
170 print chr$(178); : goto 200
180 print chr$(179); : goto 200
190 print " ";
200 next x
210 print
220 next y
230 data 4,2,2,2,6,11,8,2,2,2,2,2,5
240 data 1,11,11,11,11,11,1,11,11,11,11,11,1
250 data 1,11,4,2,5,11,3,2,2,2,5,11,1
260 data 1,11,1,11,1,11,11,11,11,11,1,11,1
270 data 1,11,1,11,3,2,2,2,5,11,1,11,1
280 data 1,11,1,11,11,11,11,11,1,11,1,11,1
290 data 1,11,3,2,11,2,5,11,1,11,1,11,1
300 data 1,11,11,11,11,11,1,11,1,11,1,11,1
310 data 8,2,9,2,2,2,6,11,3,2,6,11,1
320 data 1,11,1,11,11,11,11,11,11,11,11,11,1
330 data 1,11,3,2,11,2,2,2,2,2,5,11,1
340 data 1,11,11,11,11,11,11,11,11,11,1,11,1
350 data 3,2,2,2,2,2,2,2,2,2,10,11,1