; inc increments the value of the target address by one in the absolute mode

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        lda     #64
        sta     $c100
start   inc     $c100
        lda     $c100
        jsr     $e716
        cmp     #90
        bne     start
        rts
