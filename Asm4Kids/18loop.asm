; loop using cpx (compare x) and bne (branch is not equal)
; prints a-z

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        jsr     $e544
        ldx     #65     ; initialize x with 65 - ASCII a
loop    txa             ; transfer x to accumulator
        jsr     $e716   ; print it to the screen
        inx             ; increment x
        cpx     #91     ; compare x with 91
        bne     loop    ; if x <> 91 then branch back to loop
        rts
