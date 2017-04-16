; Turn key repeat on
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        lda     #$80
        sta     $28a    ; 650 - repeat all keys if $80
        rts
