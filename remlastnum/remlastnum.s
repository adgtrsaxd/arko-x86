        section .text
        global  remlastnum
remlastnum:
        push    ebp
        mov     ebp, esp
        push    esi
        push    edi
        push    ebx

        xor     eax, eax        ; set eax to 0
        mov     ecx, 0xffffffff ; set ecx to have possibly the longest text
        mov     edi, [ebp + 8]  ; ptr to start of text
        repne   scasb
        sub     edi, 2          ; change ptr to be in last position
        mov     esi, edi

        not     ecx             ; get length of scanned text
        dec     ecx

        std                     ; set direction flag to decrement
        mov     ebx, -1         ; set ebx value to -1, to be enable after first inc check if result == 0 
nextchar:
        lodsb
        
        cmp     al, '0'         ; check if char is number
        jb      copy
        cmp     al, '9'
        jg      copy

        inc     ebx             ; increment value, when digit, without checking if it was last digit to not add jumps
        jz      endloop

copy:
        mov     [edi], al
        dec     edi
endloop:
        loop    nextchar

finish:
        lea     eax, [edi + 1]  ; set result to last saved char in edi    
        cld                     ; restore direction flag
        pop     ebx
        pop     edi
        pop     esi
        pop     ebp
        ret

        
