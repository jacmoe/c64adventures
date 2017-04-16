;
; routine to clear a bitmap screen
; clears 8192 bytes from 8192 onwards

*=$C000

clrscn  LDA #0
        STA 251
        LDA #32
        STA 252
        LDX #32
block   LDY #0
bytev   LDA #0
        STA (251),Y
        DEY
        BNE bytev
        INC 252
        DEX
        BNE block
        RTS