        section .text
        global  gethex
gethex:
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
        jb      not_hex_number
        cmp     al, '9'
        jg      not_number

        sub     al, '0'
        jmp     multiply

not_number:
        cmp     al, 'A'
        jb      not_hex_number
        cmp     al, 'F'
        jg      not_hex_number
        sub     al, 'A'
        add     al, 10
multiply:
        inc     bl              ; inc to idticate number has appeared
        movzx   eax, al         ; set edi to number

        shl     edx, 4          ; multiply edx by 16
        add     edx, eax        ; add readed number from text after multiplication
        
        jmp     nextchar
not_hex_number:
        test    bl, bl
        jz     nextchar
fin:
        mov     eax, edx
        pop     ebx
        pop     edi
        pop     esi
        pop     ebp
        ret

        
