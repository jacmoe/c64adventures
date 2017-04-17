; indirect indexed addressing (y register only)
; Uses a zero-page pointer, but uses y instead of x
; instead of pointing to a series of addresses in the zero page
; it points to a single address offset by the value of y
; Since it requires only two bytes of zero-page, it is much easier to
; use than indexed indirect

; address = pointer stored in zero page + x register value = location of address

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544
        ldx     #$d1    ; low byte target address
        stx     $fb     ; low byte pointer
        ldx     #$c0    ; high byte target address
        stx     $fc     ; high byte pointer
        ldx     #65     ; ASCII 'a'
        stx     $c0d1   ; store in first target address
        inx
        stx     $c0d3
        inx
        stx     $c0d5
        ldy     #$0     ; set y to $0
        lda     ($fb),y ; indirect indexed adressing mode
        jsr     $e716
        iny
        iny
        lda     ($fb),y
        jsr     $e716
        iny
        iny
        lda     ($fb),y
        jsr     $e716
        rts
