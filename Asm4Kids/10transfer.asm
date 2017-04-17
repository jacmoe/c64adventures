; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544   ; clear the screen
        ldx     #$54    ; load 84 into the x register ('t')
        txa             ; transfer x register to the accumulator
        jsr     $e716   ; output to screen
        ldx     #$41    ; load 65 into x register ('a')
        txa             ; transfer x register to the accumulator
        sta     49200   ; store accumulator value in address 49200
        ldy     49200   ; load value of 49200 into y register (absolute addressing mode)
        tya             ; transfer y to a
        jsr     $e716   ; output to screen
        ldy     #$58    ; load y with 88 ('x')
        tya             ; transfer y to a
        jsr     $e716   ; output to screen
        rts
