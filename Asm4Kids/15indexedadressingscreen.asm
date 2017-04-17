; uses indexed adressing with screen and  color memory

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544   ; clear screen
        lda     #4
        sta     $d021   ; background color (53281)
        sta     $d020   ; border color (53280)
        lda     #1
        ldx     #0
        sta     $d800,x ; base color address + x
        sta     $400,x  ; base screen address + x
        inx
        sta     $d800,x
        sta     $400,x
        inx
        sta     $d800,x
        sta     $400,x
        rts
