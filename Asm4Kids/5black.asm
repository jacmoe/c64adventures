; Loads 0 into the accumulator
; sta puts that value into the soft-switch address
; that controls background color ($d021)
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        lda     #$0
        sta     $d021
        rts
