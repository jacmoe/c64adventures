;************************************************
;*              sbc by three's                  *
;*                                              *
;* Goes backwards, printing only every  third   *
;* character.                                   *
;*                                              *
;* Important to set the carry flag before       *
;* using subtract!                              *
;*                                              *
;************************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544
        lda     #93
start   sec             ; set the carry
        sbc     #3      ; subtract 3 from the accumulator
        jsr     $e716
        cmp     #66
        bne     start
        rts
