5 rem store a 16-bit number in two 8-bit memory registers
10 al = 32768 : ah = 32769 : rem low and high addresses
20 print "type a positive integer"
30 print "ranging from 0 to 65,535"
40 input x
50 hibyte = int(x / 256)
60 lobyte = x - hibyte * 256
70 poke al, lobyte
80 poke ah, hibyte
90 rem retrieving the number
100 n = peek(ah) * 256 + peek(al)
110 print : print "number is: ";n
120 end