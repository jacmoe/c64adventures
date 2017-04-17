;****************************************
;*                                      *
;*      Joystick                        *
;*                                      *
;* Register at $dc01 :                  *
;*                                      *
;* 7   6   5   4   3   2   1   0        *
;* X   X   X   F   R   L   D   U        *
;*                                      *
;*      X = Unused by joystick          *
;*      F = Fire button                 *
;*      R = Joystick right              *
;*      L = Joystick left               *
;*      D = Joystick down               *
;*      U = Joystick up                 *
;* Not pressed = 1                      *
;* Pressed = 0                          *
;*                                      *
;* Joystick values EORed with $ff :     *
;*      0 - Neutral                     *
;*      1 - Up                          *
;*      2 - Down                        *
;*      4 - Left                        *
;*      5 - Up Left                     *
;*      6 - Down Left                   *
;*      8 - Right                       *
;*      9 - Up Right                    *
;*      10 - Down Right                 *
;*      16 - Fire button pressed        *
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
chrout  =$ffd2

        jsr     clear
        lda     #$ff    ; value to EOR
        sta     ofset   ; offset
        lda     #64     ; EORed value of fire button + 48
        sta     fire    ; store here for easy reference
start   lda     jstick  ; read joystick
        eor     ofset   ; eor with $ff
        clc             ; clear the carry flag
        adc     #48     ; add 48
        jsr     chrout  ; print modified joystick value to screen
        cmp     fire    ; is it the fire button?
        beq     end     ; if it is, then quit
        jmp     start   ; go back and read the joystick
end     rts


























