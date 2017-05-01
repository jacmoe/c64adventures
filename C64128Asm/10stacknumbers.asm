; putting two numbers on the stack
; and adds them
; 10 SYS (32768)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $33, $32, $37, $36, $38, $29, $00, $00, $00


        *=$8000
        lda     #35
        pha             ; push the contents of the accumulator on to the stack
        lda     #49
        pha
        cld
        clc
        pla             ; pull top value off the stack and into the accumulator
        sta     $fd
        pla
        adc     $fd
        sta     $fe
        rts


; php = push p register onto the stack
; plp = pull from the stack into the p register
; php and plp ops are often used in programs to save and restore the p register
; so that the p register is not messed about as a result of a subroutine