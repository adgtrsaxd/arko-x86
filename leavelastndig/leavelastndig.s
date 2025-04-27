        section .text
        global  leavelastndig
leavelastndig:
        push    ebp             ; ebp to stack
        mov     ebp, esp        ; set ebp to esp
        push    ebx             ; save ebx
        push    esi             ; save esi
        push    edi             ; save edi

        mov     edx, [ebp + 8]  ; load first arg to edx (ptr to text)
        mov     esi, [ebp + 12] ; load second arg to esi (number of digits to leave)
        mov     edi, edx        ; edi set ptr to first char of text, to check loop of nextchar
        dec     edi

        mov     ecx, edi
        
        cmp     byte [edx], 0        ; check if text is empty
        jz      fin             
find_last_char_index:
        mov     al, [edx]       ; load to al char
        inc     edx             ; increment edx
        test    al, al          ; check is it end of text
        jnz     find_last_char_index    ; continue if not end of text
length_found:                   ; found last char index in memory
        sub     edx, 2
        mov     ecx, edx

nextchar:
        cmp     edi, edx        ; check if whole text was checked 
        jz      fin
        mov     al, [edx]       ; load char
        dec     edx             ; decrement ptr
        cmp     al, '0'         ; check if char is below < '0'
        jb      nextchar
        cmp     al, '9'         ;check is char greater than > '9'
        jg      nextchar        
copy:                           ; copy char if is beetwen '0' and '9'
        mov     [ecx], al
        dec     ecx
        dec     esi
        jnz     nextchar
fin:
        inc     ecx;
        pop     edi     ; restore edi
        pop     esi     ; restore esi
        pop     ebx     ; restore ebx
        mov     eax, ecx; set result
        pop     ebp     ; restore ebp
        ret

        
