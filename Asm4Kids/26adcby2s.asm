; adc by two's
; the accumulator is incremented by two each time the program loops
; the clc instruction makes sure that the contents of the accumulator
; are incremented only by two and not two plus the carry

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544
        lda     #65
start   clc
        adc     #2
        jsr     $e716
        cmp     #89
        bne     start
        rts
