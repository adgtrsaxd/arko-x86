        section .text
        global  remrep
remrep:
        push    ebp             ; ebp to stack
        mov     ebp, esp        ; set ebp to esp
        push    ebx             ; save ebx
        push    esi             ; save esi
        push    edi             ; save edi

        sub     esp, 256
        mov     edi, esp 

        xor     al, al          ; set al to 0
        mov     ecx, 256        ; set iteration register to 256
        rep     stosb           ; set whole edi vector of seen chars to 0, after it edi == esp

        mov     ebx, esp
        mov     esi, [ebp + 8]    ; input pointer
        mov     edi, esi          ; destination starts at same address
nextchar:
        lodsb
        test    al, al
        jz      fin
        movzx   eax, al         ; Move AL into EAX with zero-extension
        mov     dl, byte[ebx + eax]
        cmp     dl, 1
        jz     nextchar

        inc     byte [ebx + eax]
        mov     [edi], al
        inc     edi
        jmp     nextchar

fin:    
        mov     byte[edi], 0

        add     esp, 256
        
        pop     edi     ; restore edi
        pop     esi     ; restore esi
        pop     ebx     ; restore ebx
        mov     eax,    [ebp + 8]
        pop     ebp     ; restore ebp
        ret

        
