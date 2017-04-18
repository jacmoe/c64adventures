;****************************************
;*                                      *
;*      Noisy space sprite              *
;*                                      *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
sprite0 =$7f8           ; 2040
enable  =$d015          ; 53269
color0  =$d027          ; 53287
sp0x    =$d000          ; 53248
sp0y    =$d001          ; 53249
msbx    =$d010          ; 53264
shouse  =$0340          ; 832
sigvol  =$d418          ; 54296
atdcy1  =$d405          ; 54277
surel1  =$d406          ; 54278
vcreg1  =$d404          ; 54276
frelo1  =$d400          ; 54272
frehi1  =$d401          ; 54273
hi      =$c300          ; 49920
why     =$c304          ; 49924
ex      =$c306          ; 49926
clear   =$e544          ; 58692

        jsr     clear

        ; sprite code
        lda     #0      ; color for black
        sta     $d020   ; border black (poke 53280,0)
        sta     $d021   ; background black (poke 53281,0)
        lda     #$0d
        sta     sprite0
        lda     #1
        sta     enable
        lda     #2      ; red
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
        sta     why     ; preserve y
move    stx     sp0x
        lda     why
        sta     sp0y
        inc     ex      ; increment x through ex
        ldx     ex

        ; sound code
        lda     #10
        sta     hi

start   lda     #15
        sta     sigvol  ; set volume to 15
        lda     #128
        sta     atdcy1  ; set attack/decay to 128
        sta     surel1  ; set sustain/release to 128
        lda     hi
        sta     frelo1  ; store 195 in the low frequency
        lda     hi
        sta     frehi1  ; store 16 in the high frequency
        lda     #17
        sta     vcreg1
        ldy     #0
        ldx     #0
set     ldx     #0
play    inx
        cpx     #20
        bne     play
        iny
        cpy     #20
        bne     set
        lda     #0      ; null registers with 0
        sta     vcreg1
        sta     atdcy1
        sta     surel1
        sta     frelo1
        sta     frehi1
        inc     hi
        lda     hi
        cmp     #40
        bne     start
        ldx     ex
        cpx     #254
        bne     move    ; back to sprite

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
