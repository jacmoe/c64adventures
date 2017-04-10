300 s=54272 : poke s+24,15 : rem s+24 is master volume
310 poke s+5,0 : poke s+6,240 : rem envelope
320 for k=1 to 4
330 poke s+4,33 : rem start sawtooth waveform (32 + 1)
340 poke s,0 : poke s+1,40 : rem frequency, first note
350 for t=1 to 500 : next
360 poke s,0 : poke s+1,30 : rem frequency, second note
370 for t=1 to 500 : next
380 poke s+4,32 : rem stop sawtooth (32 + 0)
390 next k