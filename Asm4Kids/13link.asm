; link
; resets the pointers the the actual beginning of BASIC
; thereby linking two programs together

; 10 SYS (49200)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $32, $30, $30, $29, $00, $00, $00

        *=$c030
        lda     #1
        sta     $2b
        lda     #8
        sta     $2c
        rts
