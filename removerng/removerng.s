        section .text
        global  removerng
removerng:
        push    ebp
        mov     ebp, esp
        push    ebx

        mov     edx, [ebp + 8]
        mov     ecx, edx

        mov     bl, [ebp + 12]
        mov     bh, [ebp + 16]

nextchar:
        mov     al, [edx]
        inc     edx
        test    al, al
        jz      fin
        cmp     al, bl
        jb      copy
        cmp     al, bh
        jbe     nextchar
copy:
        mov     [ecx], al
        inc     ecx
        jmp     nextchar

fin:
        mov     [ecx], al
        
        pop     ebx
        mov     al, [ebp + 8]
        pop     ebp
        ret

        
