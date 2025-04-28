        section .text
        global  reverselet
reverselet:
        push    ebp             ; ebp to stack
        mov     ebp, esp        ; set ebp to esp
        push    ebx             ; save ebx
        push    esi             ; save esi
        push    edi             ; save edi

        xor     eax, eax        ; set eax to 0
        mov     ecx, 0xffffffff ; set ecx to have possibly the longest text
        mov     edi, [ebp + 8]  ; ptr to start of text
        mov     esi, edi
        repne   scasb           ; find end of text
        sub     edi, 2          ; change ptr to be in last position
        not     ecx             ; get length of scanned text
        dec     ecx

nextchar:
        lodsb
        
        cmp     esi, edi        ; check if esi > edi. It is done after inc of esi, so esi need to be greater, and greater or equal 
        jg      fin

        cmp     al, 'A'
        jb      nextchar
        cmp     al, 'z'
        jg      nextchar
reverse:
        mov     ah, [edi]

        cmp     esi, edi        ; check if esi > edi. It is done before dec of edi, so esi need to be greater, and greater or equal
        jg      fin

        dec     edi 

        cmp     ah, 'A'
        jb      reverse
        cmp     ah, 'z'
        jg      reverse

        mov     [edi + 1], al
        mov     [esi - 1], ah

        jmp nextchar
fin:

        cld
        mov     eax, [ebp + 8]  ; set result
        pop     edi     ; restore edi
        pop     esi     ; restore esi
        pop     ebx     ; restore ebx
        pop     ebp     ; restore ebp
        ret

        
