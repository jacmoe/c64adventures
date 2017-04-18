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
clear   =$e544
jstick  =$dc01
ofset   =$c300
fire    =$c302
ex      =$c304
why     =$c306
sprite0 =$7f8
enable  =$d015
color0  =$d027
sp0x    =$d000
sp0y    =$d001
msbx    =$d010
shouse  =$0340

        jsr     clear
        lda     #$0d
        sta     sprite0
        lda     #1
        sta     enable
        lda     #2
        sta     color0
        ldx     #0
        lda     #$00
cleanup sta     shouse,x
        inx
        cpx     #64
        bne     cleanup
        ldx     #0
build   lda     data,x
        sta     shouse,x
        inx
        cpx     #63
        bne     build
        lda     #0
        sta     msbx
        lda     #$ff
        sta     ofset
        lda     #16
        sta     fire
        lda     #40
        sta     ex      ; starting x position of sprite
        sta     sp0x
        lda     #70
        sta     why     ; starting y position of sprite
        sta     sp0y

        ; read the joystick
start   lda     jstick
        eor     ofset
        cmp     #1
        beq     up
        cmp     #2
        beq     down
        cmp     #4
        beq     left
        cmp     #8
        beq     right
        cmp     fire
        beq     end
        ldx     #0
pause   inx
        cpx     #254
        bne     pause
        jmp     start
up      dec     why
        ldy     why
        cpy     #0      ; check for adjustment
        beq     down
        jmp     move
down    inc     why
        ldy     why
        cpy     #255
        beq     up
        jmp     move
left    dec     ex
        ldx     ex
        cpx     #0
        beq     right
        jmp     move
right   inc     ex
        ldx     ex
        cpx     #255
        beq     left
        jmp     move
end     rts

        ; movement of sprite
move    stx     sp0x
        sty     sp0y
        ldx     #0
mpause  inx
        cpx     #254
        bne     mpause
        jmp     start


        ; sprite data
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
