10 rem decimal to binary conversion program
20 dim bt$(8) : print chr$(147)
30 print : print "     decimal-binary conversion"
40 print : print "enter a positive integer (1 to 255):"
50 bn$ = "" : print : input a$
60 if val(a$) < 1 or val(a$) > 255 then 40
70 nr = val(a$)
80 for l = 8 to 1 step -1
90      q = nr / 2
100     r = q - int(q)
110     if r = 0 then bt$(l) = "0" : goto 130
120     bt$(l) = "1"
130     nr = int(q)
140 next l
150 print "binary: ";
160 for l = 1 to 8
170     print bt$(l);
180 next l
190 print
200 goto 40