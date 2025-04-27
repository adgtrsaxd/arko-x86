        section .text
        global  remnth
remnth:
        push    ebp
        mov     ebp, esp
        push    ebx
        push    esi

        
        mov     ebx, [ebp + 12]
        mov     esi, ebx
        mov     edx, [ebp + 8]
        mov     ecx, edx

nextchar:
        mov     al, [edx]
        inc     edx
        test    al, al
        jz      fin
        dec     esi
        jz      reset
copy:
        mov     [ecx], al
        inc     ecx
        jmp     nextchar
reset:
        mov esi, ebx
        jmp nextchar

fin:
        mov     [ecx], al
        
        pop     esi
        pop     ebx
        mov     al, [ebp + 8]
        pop     ebp
        ret

        
