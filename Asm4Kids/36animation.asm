;****************************************
;*                                      *
;*      animation                       *
;*                                      *
;* Needs a pause loop because it's too  *
;* fast!                                *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
clear   =$e544
chrout  =$ffd2
plot    =$fff0
ex      =$c200
why     =$c202
ball    =$c204
space   =$c206

        jsr     clear
        ldx     #10     ; set to row 10
        stx     ex
        ldy     #0      ; set to column 0
        sty     why
        lda     #113    ; ascii for ball
        sta     ball
        lda     #32     ; ascii for space
        sta     space
start   ldx     ex
        ldy     why
        clc
        jsr     plot    ; plot the ball
        lda     ball    ; load the ball
        jsr     chrout  ; print the ball

        ldy     #0      ; begin pause loop
pause1  ldx     #0
pause2  inx
        cpx     #$fe
        bne     pause2
        iny
        cpy     #$0a
        bne     pause1  ; end pause loop

        ldx     ex      ; load x register with last row plot
        ldy     why     ; load y register with last column plot
        clc
        jsr     plot    ; plot the space
        lda     space
        jsr     chrout  ; erase the ball with space
        inc     why     ; increment the column value (y)
        ldy     why     ; load the y register with the next column
        cpy     #38     ; is it near the last column
        bne     start   ; if not. print and erase another ball
        clc
        jsr     plot
        lda     ball
        jsr     chrout  ; put a ball on the screen so there's something left
        rts
