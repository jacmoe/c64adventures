; 10 sys 49152

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000         ; origin directive (49152)

        lda     #72     ; load ascii 'h' into the accumulator
        jsr     $ffd2   ; call chrout kernal subroutine
        lda     #73     ; load ascii 'i' into the accumulator
        jsr     $ffd2   ; call chrout kernal subroutine
        rts             ; return to basic

