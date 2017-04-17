; indexed indirect addressing
; a bit like a "bank shot" in pool
; address = pointer stored in zero page + x register value = location of address

; in zero page ($0-ff) a set of pointers are stored in 2-byte configurations
; low-byte is at the lower address, and the high-byte is at the higher address

; each pointer takes up two bytes (low and high) and that means that
; the indexing will have to be in steps of two


; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


        *=$c000
        jsr     $e544   ; clear screen
        ldy     #65     ; load y with ASCII 'a'
        sty     $c100   ; store y in $c100
        lda     #$00    ; low byte of target address
        sta     $fb     ; store in lb pointer address
        lda     #$c1    ; high byte of pointer address
        sta     $fc     ; store in hb pointer address
        ldx     #$0
        lda     ($fb,x) ; indexed indirect lda
        jsr     $e716   ; output to screen
        rts
