; print the alphabet to the screen until it reaches value 90
; jmp and beq allows us to place inx after
; the comparison and branch instructions

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        ldx     #65
start   txa
        jsr     $e716
        cmp     #90
        beq     end
        inx
        jmp     start
end     rts
