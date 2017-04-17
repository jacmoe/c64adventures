; using a nested loop to overcome the 255 limitation in the x/y registers
; loop 127 * 10 times

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544
        ldy     #0
loop1   ldx     #33
loop2   txa
        jsr     $e716
        inx
        cpx     #127
        bne     loop2
        iny
        cpy     #10
        bne     loop1
        rts
