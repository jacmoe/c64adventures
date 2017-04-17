; inc in  indexed mode
; fills the screen with an a and a lot of emptiness or junk
; depending on what's in the addresses

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
        ldx     #0
        lda     #64
        sta     $c100
start   inc     $c100,x
        lda     $c100,x
        jsr     $e716
        inx
        cpx     #90
        bne     start
        rts
