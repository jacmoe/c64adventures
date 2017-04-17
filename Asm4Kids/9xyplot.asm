; loads x and y registers with row and column numbers and calls the
; plot subroutine to move the cursor before it outputs ascii 88 to the screen
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544
        ldx     #12     ; row number
        ldy     #19     ; column number
        clc             ; clear the c flag
                        ; c flag must be cleared to set position
                        ; otherwise plot reads position instead
        jsr     $fff0   ; plot subroutine
        lda     #88     ; ASCII for 'x'
        jsr     $e716   ; output to screen
        rts
