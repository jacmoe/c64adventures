; clears the screen, then outputs 'x' to the screen
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544   ; clear screen
        lda     #88     ; load the accumulator with the decimal value 88
        jsr     $e716   ; output to screen
        rts
