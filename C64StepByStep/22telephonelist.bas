10 print chr$(147)
20 data j.baker,322,g.hilton,166,r.hermann,103,s.klein,191
30 data m.perekera,86,t.philips,71,p.richard,100
40 data d.smith,27
50 print "personal telephone listing"
60 for t=1 to 2000 : next
70 print chr$(147) : poke 214,4 : print
80 print "complete list......press 1"
90 print "selective list.....press 2"
100 input "choice";choice
110 if choice=2 then 190
120 print chr$(147)
130 print : print : print
140 for c=1 to 8
150 read name$,n
160 print tab(6);name$;tab(20);n : print
170 next c
180 end
190 print chr$(147)
200 input entry$
210 result$="name not found"
220 for c=1 to 8
230 read name$,n$
240 if name$=entry$ then result$=name$+".........."+n$
250 next c : print chr$(147)
260 print result$ : for t=1 to 2000
265 rem 'restore' sets the data pointer back to the beginning
270 next : restore : print chr$(147) : goto 50