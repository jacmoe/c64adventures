; append
; resets the pointers showing the beginning of the BASIC program
; to the end of the program in memory
; Needs the link program

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        ldx     $2d
        dex
        dex
        stx     $2b
        ldx     $2e
        stx     $2c
        rts
