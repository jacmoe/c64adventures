; prints 'jacob' on the screen
; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544
        lda     #74     ; j
        jsr     $e716
        lda     #65     ; a
        jsr     $e716
        lda     #67     ; c
        jsr     $e716
        lda     #79     ; o
        jsr     $e716
        lda     #66     ; b
        jsr     $e716
        rts
