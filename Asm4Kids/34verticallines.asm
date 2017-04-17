;****************************************
;*                                      *
;*      vertical lines                  *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
bar1    =55316
bar2    =55556
bar3    =55796
bar4    =56036
bar5    =56276
lin1    =1044
lin2    =1284
lin3    =1324
lin4    =1564
lin5    =1804
clear   =$e544

        jsr     clear
        ldx     #$0
start   lda     #224
        sta     lin1,x
        sta     lin2,x
        sta     lin3,x
        sta     lin4,x
        sta     lin5,x
        lda     #2
        sta     bar1,x
        sta     bar2,x
        sta     bar3,x
        sta     bar4,x
        sta     bar5,x
        ldy     #0
inxr    inx
        iny
        cpy     #40
        bne     inxr
        cpx     #240
        bne     start
        rts
