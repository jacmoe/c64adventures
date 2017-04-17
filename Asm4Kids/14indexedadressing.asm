; indexed absolute adressing
; add the value of x or y register to the address in the operand
; address = adress + value of x or y register

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        ldx     #0
        txa
        sta     $400,x  ; stores at $400
        inx             ; add 1 to x
        txa
        sta     $400,x  ; store at $401
        rts
