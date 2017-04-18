;****************************************
;*                                      *
;*      Assembly sounds                 *
;*                                      *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
sigvol  =$d418          ; 54296
atdcy1  =$d405          ; 54277
surel1  =$d406          ; 54278
vcreg1  =$d404          ; 54276
frelo1  =$d400          ; 54272
frehi1  =$d401          ; 54273

        lda     #15
        sta     sigvol  ; set volume to 15
        lda     #128
        sta     atdcy1  ; set attack/decay to 128
        sta     surel1  ; set sustain/release to 128
        lda     #195
        sta     frelo1  ; store 195 in the low frequency
        lda     #16
        sta     frehi1  ; store 16 in the high frequency
        lda     #17
        sta     vcreg1
        ldy     #0
        ldx     #0
set     ldx     #0
play    inx
        cpx     #255    ; double delay loop to play sound
        bne     play
        iny
        cpy     #100
        bne     set
        lda     #0      ; null registers with 0
        sta     vcreg1
        sta     atdcy1
        sta     surel1
        sta     frelo1
        sta     frehi1
        rts
