        section .text
        global  leaverng
leaverng:
        push    ebp
        mov     ebp, esp
        push    esi
        push    edi
        push    ebx
        mov     esi, [ebp + 8]  ; src ptr
        mov     edi, esi        ; dst ptr
        mov     bh, [ebp + 12]  ; letter from which leave text
        mov     bl, [ebp + 16]  ; letter to which leave text
nextchar:
        lodsb
        test    al, al
        jz      fin
        cmp     al, bh
        jb      nextchar
        cmp     al, bl
        jg      nextchar
copychar:
        mov     [edi], al
        inc     edi
        jmp     nextchar
fin:
        mov     byte [edi], 0
        mov     eax, [ebp + 8]
        pop     ebx
        pop     edi
        pop     esi
        pop     ebp
        ret

        
