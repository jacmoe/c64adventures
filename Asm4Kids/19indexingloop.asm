; example of indexed addressing and a loop

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544
        ldx     #0
        ldy     #1
start   tya
        sta     55296,x
        txa
        sta     1024,x
        inx
        cpx     #255
        bne     start
        rts
