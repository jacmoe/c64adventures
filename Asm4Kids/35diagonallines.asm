;****************************************
;*                                      *
;*      diagonal lines                  *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
chrout  =$ffd2
clear   =$e544
plot    =$fff0

        jsr     clear
        ldx     #0
        ldy     #0
        lda     #18     ; character for inverse
        jsr     chrout
start   clc
        jsr     plot
        lda     #32     ; character for space
        jsr     chrout
        inx             ; next row
        iny
        cpx     #25     ; is it at the bottom row yet?
        bne     start   ; if not, go back and do it again
        rts
