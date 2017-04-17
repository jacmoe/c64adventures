; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544   ; clear screen (58692)
        ldx     #90
        ldy     #65
        txa
        jsr     $e716   ; output to screen
        tya
        jsr     $e716
        dex             ; subtract 1 from x register (decrement x)
        txa
        jsr     $e716
        iny             ; add 1 to y register (increment y)
        tya
        jsr     $e716
        rts
