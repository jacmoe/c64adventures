; Turn key repeat off
; 10 SYS (49200)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $32, $30, $30, $29, $00, $00, $00


        *=$c030
        lda     #$0
        sta     $28a    ; 650 - repeat all keys if $80
        rts
