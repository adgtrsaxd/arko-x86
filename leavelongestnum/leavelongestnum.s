        section .text
        global  leavelongestnum
leavelongestnum:
        push    ebp
        mov     ebp, esp
        push    esi     ; save esi value in stack
        push    edi     ; save edi value in stack
        push    ebx     ; save ebx value in stack
        mov     esi, [ebp + 8]
        xor     ebx, ebx      ; set ebx registers to 0
                        ; bh length of the longest num founded
                        ; bl length of current num
        mov     edx, esi; edx pointer to end of the longest num sequence
nextchar:
        lodsb           ; load byte of text from pointer in esi and then increment it
        cmp     al, '0' ; check if loaded char is digit
        jb      endofdigit
        cmp     al, '9'
        jg      endofdigit
        inc     bl      ; increment lenght of current num
        jmp     nextchar; if it is number it for sure not end of text
endofdigit:
        cmp     bl, bh  ; check if current num len greater than longest currently found
        jb      xxx
        mov     bh, bl  ; set bh to bl if bl greater
        lea     edx, [esi - 1]; set edx to point the end of the seq
xxx:
        xor     bl, bl  ; set bl to 0 
        test    al, al  ; check if it is end of text
        jnz     nextchar; if is finish
fin:
        mov     byte [edx], 0
        movzx   ebx, bh
        sub     edx, ebx
        mov     eax, edx
        pop     ebx     ; restore ebx value from stack
        pop     edi     ; restore edi value from stack
        pop     esi     ; restore esi value from stack
        pop     ebp
        ret
