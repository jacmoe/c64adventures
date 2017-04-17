;****************************************
;*                                      *
;*      low-res lines                   *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
bar1    =55416
bar2    =55496
lin1    =1144
lin2    =1224
clear   =$e544

        jsr     clear
        ldx     #$0
        ldy     #2
start   lda     #224
        sta     lin1,x  ; first line of spaces
        sta     lin2,x  ; second line of spaces
        tya
        sta     bar1,x  ; first color of line
        clc
        adc     #5      ; change color with adc
        sta     bar2,x  ; second color of line
        inx
        cpx     #39
        bne     start
        rts
