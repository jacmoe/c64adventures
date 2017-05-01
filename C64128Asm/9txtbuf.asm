; routine for moving a block of text
; example of indexed addressing
; 10 sys 32768

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $33, $32, $37, $36, $38, $29, $00, $00, $00

        *=$8000
txtbuf  =$02a7
eol     =$0d

        jmp     datmov

text
        byte   $54,$41,$4b,$45,$20,$4d,$45,$20
        byte   $54,$4f,$20,$59,$4f,$55,$52,$20
        byte   $4c,$45,$41,$44,$45,$52,$21,$0d

datmov  ldx     #0
loop    lda     text,x
        sta     txtbuf,x
        cmp     #eol
        beq     fini
        inx
        jmp     loop
fini    rts
