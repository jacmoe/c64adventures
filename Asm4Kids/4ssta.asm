; Loads a value into the accumulator in immediate adressing mode (lda)
; stores the value an an unused adress (sta), clears the accumulator
; from the absolute mode (lda) adress it first stored the value
; The program then prints the character for the ASCII code in the accumulator
; with jsr $e716
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544   ; cls
        lda     #$43    ; ASCII 'c'
        sta     $c050
        lda     #$0     ; Immediate mode
        lda     $c050   ; Absolute mode
        jsr     $e716
        rts
