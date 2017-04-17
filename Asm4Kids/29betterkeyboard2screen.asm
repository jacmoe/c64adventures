;****************************************
;*                                      *
;*      Read return                     *
;*                                      *
;*  Reds keypresses and prints them     *
;*  until Return is pressed             *
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
scan    jsr     scnkey
        jsr     getin
        beq     scan
        cmp     #$0d    ; compare with ASCII for return (13)
        beq     end     ; jump to end of program if return is pressed
        jsr     chrout
        jmp     scan
end     rts
