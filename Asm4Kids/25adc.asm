; indexed adc
; print az by adding 25 to the accumulator which already contains 65

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        lda     #65
        jsr     $e716
        adc     #25     ; adc = add with carry, accumulator
        jsr     $e716
        rts
