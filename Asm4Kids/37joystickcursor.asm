;****************************************
;*                                      *
;*      joystick cursor                 *
;*                                      *
;*                                      *
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
        lda     #$ff    ;  or value
        sta     ofset
        lda     #16     ; fire button
        sta     fire
        lda     #32     ; space for the cursor
        sta     mark
        lda     #18     ; inverse code
        sta     inverse
        lda     #146    ; normal code
        sta     normal
start   lda     jstick
        eor     ofset
        cmp     #1      ; joystick up?
        beq     up
        cmp     #2      ; down?
        beq     down
        cmp     #4      ; left?
        beq     left
        cmp     #8      ; right?
        beq     right
        cmp     fire    ; fire button pressed?
        beq     end     ; if so, end
cursor  lda     mark    ; load the space
        jsr     chrout  ; print the space
        lda     #157    ; load the left cursor
        jsr     chrout  ; back up
        lda     normal
        jsr     chrout  ; set normal
        lda     mark
        jsr     chrout
        lda     #157    ; back up
        jsr     chrout
        lda     inverse
        jsr     chrout  ; set inverse
        jmp     start   ; go do it again
up      lda     #145
        jmp     print   ; print up cursor
down    lda     #17
        jmp     print   ; print down cursor
left    lda     #157
        jmp     print   ; print left cursor
right   lda     #29
print   jsr     chrout
        jmp     cursor
end     rts

        