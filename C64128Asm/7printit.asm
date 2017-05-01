; 10 SYS (32768)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $33, $32, $37, $36, $38, $29, $00, $00, $00

        *=$8000
chrout  =$ffd2

print
        lda     #$58    ; ascii 'x'
        jsr     chrout  ; print the x
        rts
