10 rem usr demo
20 rem set up dummy machine code
25 poke 820,230
26 poke 821,98  : rem inc $62
30 poke 822,96  : rem rts
40 print chr$(147)
50 poke 785,52  : rem set up usradd to
60 poke 786,3   : rem point to 820
70 a = 0 : b = 837
80 print "pre usr a = ";a
90 a = usr(b)
100 print "post usr a = ";a
105 rem
108 rem usr is a basic statement that is used  to call sections of machine code
109 rem unlike a sys call, usr allows arguments to be passed.
110 rem Before executing usr the address of a machine code subroutine must be
112 rem seeded into usradd, which is located at the two bytes starting at 785 ($0311)
114 rem
115 rem The high byte of the fac#1 mantissa was incremented at location 98
118 rem
120 rem Four bytes of fac#1 mantissa:
130 rem $d2             $40             $00             $00
140 rem 1101 0010       0100 0000       0000 0000       0000 0000
150 rem
160 rem 1101001001.0000000000000000
170 rem
180 rem ignoring non-significant zeros and sorting by binary into bytes:
190 rem 0000 0011       0100 1001
200 rem $03             049
210 rem
220 rem $0349 = 841