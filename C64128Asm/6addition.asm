; 10 SYS (32768)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $33, $32, $37, $36, $38, $29, $00, $00, $00


        *=$8000
        clc             ; clear carry
        lda     #2      ; load 2 into the accumulator
        adc     #2      ; add with carry 2
        sta     $02a7   ; store accumulator in memory address $02a7 (679)
        rts
