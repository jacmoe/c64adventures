;****************************************
;*                                      *
;*      joystick draw                   *
;*                                      *
;* Does not work!                       *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
clear   =$e544
jstick  =$dc01
ofset   =$c200
fire    =$c202
inverse =$c204
normal  =$c206
mark    =$c208
chrout  =$ffd2

        jsr     clear
        lda     #$ff
        sta     ofset
        lda     #16
        sta     fire
        lda     #32
        sta     mark
        lda     #18
        sta     inverse
        lda     #146
        sta     normal
start   lda     jstick
        eor     ofset
        cmp     #1
        beq     up
        lda     inverse
        jsr     chrout
        ldx     #0      ; begin pause loop
pause   inx
        cpx     #254
        bne     pause   ; end pause loop
        jmp     start
up      jsr     back
        lda     #145
        jmp     print
down    jsr     back
        lda     #17
        jmp     print
left    jsr     back
        lda     #157
        jmp     print
print   lsr     chrout
        lda     mark
        jsr     chrout
        jmp     start
back    lda     #157    ; subroutine
        jsr     chrout
        rts
end     rts
