;****************************************
;*                                      *
;*      Sprite tester                   *
;*                                      *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
sprite0 =$7f8   ; 2040
enable  =$d015  ; 53269
color0  =$d027  ; 53287
sp0x    =$d000  ; 53248
sp0y    =$d001  ; 53249
msbx    =$d010  ; 53264
shouse  =$0340  ; 832

        jsr     $e544
        lda     #0
        sta     $d020   ; 53280
        sta     $d021   ; 53281
        lda     #$0d
        sta     sprite0
        lda     #1
        sta     enable
        lda     #7
        sta     color0
        ldx     #0
        lda     #$00
        sta     msbx
        lda     #70
move    stx     sp0x
        sta     sp0y
        ldy     #0
pause   iny
        cpy     #255
        bne     pause
        inx
        cpx     #254
        bne     move
        ldx     #0
        lda     #1
        sta     msbx    ; set the high byte of x position
        lda     #70     ; keep y at 70
move2   stx     sp0x    ; x position is now 255 + x
        sta     sp0y
        ldy     #0
pause2  iny
        cpy     #255
        bne     pause2
        inx
        cpx     #90
        bne     move2
        rts
