        section .text
        global  getdec
getdec:
        push    ebp
        mov     ebp, esp
        push    esi
        push    edi
        push    ebx

        mov     esi, [ebp + 8]  ; ptr to string
        xor     edi, edi        ; set edi to 0
        xor     bl, bl          ; set bl to 0
        xor     edx, edx        ; set edx to 0
nextchar:
        lodsb

        test    al, al
        jz      fin

        cmp     al, '0'
        jb      not_number
        cmp     al, '9'
        jg      not_number
        
        inc     bl              ; inc to idticate number has appeared
        sub     al, '0'         ; get value of number
        movzx   edi, al         ; set edi to number
        mov     eax, 10         ; set eax to multiply by 10

        mul     edx             ; multiple edx result is save in edx [32 bit upper] and eax [32 bit down] 
        mov     edx, eax        ; set edx to 32 bit down result from eax
        add     edx, edi        ; add readed number from text after multiplication
        
        jmp     nextchar
not_number:
        test    bl, bl
        jz     nextchar
fin:
        mov     eax, edx
        pop     ebx
        pop     edi
        pop     esi
        pop     ebp
        ret

        
