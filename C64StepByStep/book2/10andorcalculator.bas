5 rem shows how and and or works
10 print chr$(147);chr$(5) : rem clear screen, white text
20 poke 214,5 : print : poke 211,2 : rem set cursor row, column
30 input "do you wish to see and/or (a/o)";a$
40 input "  enter 1st value (0-255)";v1
50 input "  enter 2nd value (0-255)";v2
60 print : print tab(4);v1;tab(9);
70 v=v1 : gosub 500 : print
80 print tab(4);v2;tab(9);
90 v=v2 : gosub 500 : print
100 if a$="a" then 130
110 print tab(3);"=";v1 or v2;tab(9);
120 v=v1 or v2 : gosub 500 : goto 150
130 print tab(3);"=";v1 and v2;tab(9);
140 v=v1 and v2 : gosub 500
150 print : print : print tab(2);
160 input "press return to continue";a$
170 goto 10
500 for c=7 to 0 step -1
510 print sgn(v and 2^c);
520 next c : print : return