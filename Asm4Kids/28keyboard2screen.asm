;****************************************
;*                                      *
;*      Keyboard to screen i/o          *
;*                                      *
;*  Uses labels to clarify              *
;*  what's going on'                    *
;*                                      *
;****************************************
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
clear   =$e544
scnkey  =$ff9f
getin   =$ffe4
chrout  =$ffd2

        jsr     clear
scan    jsr     scnkey  ; look to see if key is pressed
        jsr     getin   ; put key value in accumulator
        beq     scan    ; compare with zero
        jsr     chrout  ; if not zero, print to screen
        rts
