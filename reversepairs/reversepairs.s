        section .text
        global  reversepairs
reversepairs:
        push    ebp             ; ebp to stack
        mov     ebp, esp        ; set ebp to esp
        push    ebx             ; save ebx
        push    esi             ; save esi
        push    edi             ; save edi

        mov     edi, [ebp + 8]

nextchar:
        mov     al, [edi]
        test    al, al
        jz      fin

        mov     ah, [edi + 1]
        test    ah, ah
        jz      fin

        mov     [edi], ah
        mov     [edi + 1], al

        add     edi, 2

        jmp     nextchar
fin:
        mov     eax, [ebp + 8]  ; set result
        pop     edi     ; restore edi
        pop     esi     ; restore esi
        pop     ebx     ; restore ebx
        pop     ebp     ; restore ebp
        ret

        
