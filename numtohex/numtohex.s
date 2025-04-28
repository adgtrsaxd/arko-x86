        section .bss
        buf:    resb 9         ; reserve 9 bytes, zeroed at load

        section .text
        global  numtohex
numtohex:
        push    ebp             ; ebp to stack
        mov     ebp, esp        ; set ebp to esp
        push    ebx             ; save ebx
        push    esi             ; save esi
        push    edi             ; save edi

        mov     ebx, [ebp + 8]
        mov     edi, buf

        mov     edx, 'a'
        sub     edx, '9'
        sub     edx, 2
        std
gethex:
        mov     eax, 0x0000000f ; get last 4 bits of number
        and     eax, ebx

        shr     ebx, 4          ; divide number by 16

        cmp     eax, 10
        jb      putinbuf
             
        add     eax, edx
putinbuf:
        add     eax, '0'
        dec     edi
        mov     [edi], al

        test    ebx, ebx
        jnz     gethex

fin:
        mov     eax, edi  ; set result
        pop     edi     ; restore edi
        pop     esi     ; restore esi
        pop     ebx     ; restore ebx
        pop     ebp     ; restore ebp
        ret

        
