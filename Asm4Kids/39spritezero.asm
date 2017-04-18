;****************************************
;*                                      *
;*      Sprite zero                     *
;*                                      *
;* Moves a big, blocky sprite across    *
;* the screen.                          *
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
        lda     #$0d    ; block 13
        sta     sprite0 ; store it in pointer  for sprite 0 (poke 2040,13)
        lda     #1      ; sprite 0 enable value
        sta     enable  ; store it in the enable register (poke 53269,1)
        lda     #2      ; color red
        sta     color0  ; color register for sprite 0 (poke 53287,2)

        ldx     #0
        lda     #0
cleanup sta     shouse,x        ; store zeroes in sprite area
        inx
        cpx     #63
        bne     cleanup
        ldx     #0
        lda     #$ff
build   sta     shouse,x        ; fill up sprite area with $ff or 255
        inx                     ; to make solid block
        cpx     #63
        bne     build
        lda     #0
        sta     msbx    ; store 0 in msbx to locate sprite in horizontal
                        ; locations 0 to 255 only (poke 53264,0)
        ldx     #0
        lda     #70     ; vertical location
move    stx     sp0x    ; increment horizontal location by x (poke 53248,x)
        sta     sp0y    ; y register stays constant location of a register (poke 53249,70)
        ldy     #0      ; delay loop
pause   iny
        cpy     #255
        bne     pause
        inx
        cpx     #254
        bne     move
        rts

