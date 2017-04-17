;****************************************
;*                                      *
;*      Red/green background            *
;*                                      *
;****************************************

; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00

        *=$c000
clear   =$e544          ; 58692
scnkey  =$ff9f          ; 65439
getin   =$ffe4          ; 65508
chrout  =$ffd2          ; 65490
bkgnd   =$d021          ; 53281

        jsr     clear
        lda     #67     ; c
        jsr     chrout
        lda     #79     ; o
        jsr     chrout
        lda     #76     ; l
        jsr     chrout
        lda     #79     ; o
        jsr     chrout
        lda     #82     ; r
        jsr     chrout
        lda     #63     ; ?
        jsr     chrout
        lda     #0      ; null the accumulator
scan    jsr     scnkey
        jsr     getin
        beq     scan
        cmp     #$0d    ; was return pressed?
        beq     end     ; if so, goto end
        cmp     #82     ; was r pressed?
        beq     red     ; if so, goto red
        cmp     #71     ; was g pressed?
        beq     green   ; if so, goto green
        jmp     scan    ; if none of the above, go get another key
red     lda     #2      ; color code for red background
        sta     bkgnd
        jmp     scan
green   lda     #5      ; color code for green
        sta     bkgnd
        jmp     scan    ; go get another key
end     rts
