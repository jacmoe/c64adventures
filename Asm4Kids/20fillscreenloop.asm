; fill screen with colored characters - compare speed with basic variant
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544
        ldx     #0
loop    txa
        sta     55296,x ; base color address
        sta     55546,x
        sta     55796,x
        sta     56046,x
        sta     1024,x  ; base screen address
        sta     1274,x
        sta     1524,x
        sta     1774,x
        inx
        cpx     #250    ; compare x value with 250
        bne     loop
        rts
