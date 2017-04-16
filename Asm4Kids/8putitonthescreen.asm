; Puts a black spade on the screen
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544   ; jump to subroutine 58692
        lda     #0      ; black
        sta     55296   ; 1st color address
        lda     #88     ; spade character
        sta     1024    ; 1st char address
        rts
