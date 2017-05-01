; addition program with error-checking
; 10 SYS (32768)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $33, $32, $37, $36, $38, $29, $00, $00, $00

        *=$8000
add8bit lda     #0
        sta     $02aa
        cld
        clc
        lda     $02aa
        adc     $02a8
        bcs     error   ; jump to error if carry bit is set
        sta     $02a9
        rts
error   lda     #1
        sta     $02aa   ; store error flag (1) in memory location $02aa
        rts
