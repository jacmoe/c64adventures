;****************************************
;*                                      *
;*      Joystick colors                 *
;*                                      *
;* Change the background colors         *
;* using the joystick                   *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
jstick  =$dc01
ofset   =$c100
clear   =$e544
fire    =$c102

        jsr     clear
        lda     #$ff    ; value to eor
        sta     ofset   ; eor offset
        lda     #16     ; eor'ed value of fire button
        sta     fire    ; store here for easy reference
start   lda     jstick  ; read joystick
        eor     ofset   ; eor with $ff
        cmp     fire    ; fire button pressed?
        beq     end     ; if  it is, then quit
        sta     $d021   ; put joystick value into background color register
        jmp     start
end     rts
