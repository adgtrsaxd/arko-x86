        section .text
        global  remdigits
remdigits:
        push    ebp
        mov     ebp, esp
        mov     edx, [ebp + 8]
        mov     ecx, edx
nextchar:
        mov     al, [edx]
        inc     edx
        test    al, al
        jz      fin
        cmp     al, '0'
        jb      copy
        cmp     al, '9'
        jbe     nextchar
copy:
        mov     [ecx], al
        inc     ecx
        jmp     nextchar

fin:
        mov     [ecx], al
        
        
        mov     eax, [ebp + 8]
        pop     ebp
        ret
