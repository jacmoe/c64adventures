;****************************************
;*                                      *
;*      Planet destroyer                *
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
        lda     #0      ; color for black
        sta     $d020   ; border black (poke 53280,0)
        sta     $d021   ; background black (poke 53281,0)
        lda     #$0d
        sta     sprite0
        lda     #1
        sta     enable
        lda     #7      ; yellow
        sta     color0
        ldx     #0
        lda     #$00
cleanup sta     shouse,x
        inx
        cpx     #64
        bne     cleanup
        ldx     #0
build   lda     data,x  ; read byte values one at a time
        sta     shouse,x        ; store in spritehouse
        inx
        cpx     #63
        bne     build
        lda     #0
        sta     msbx
        ldx     #0
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
        jmp     move
        rts

data    byte    0,0,0,0,0,0,0,0,0
        byte    0,0,0,0,0,0,128,0,0
        byte    224,0,0,252,0,0
        byte    255,128,0
        byte    255,240,28
        byte    31,255,63
        byte    63,255,63
        byte    63,255,63
        byte    31,255,240
        byte    255,240,0
        byte    255,128,0
        byte    252,0,0
        byte    224,0,0
        byte    128,0,0
        byte    0,0,0,0,0,0
