global _start        ; must be declared for linker

section .text
_start:              ; entry point for the linker
    mov ecx, len     ; number of bytes to process
    mov esi, s1      ; source string pointer
    mov edi, s2      ; destination string pointer

convert_loop:
    lodsb            ; load byte from [esi] into AL, increment ESI
    or al, 20h       ; convert uppercase to lowercase (ASCII)
    stosb            ; store AL into [edi], increment EDI
    loop convert_loop

    cld              ; clear direction flag (forward)
    ; copy string to output (if needed, here already in s2)
    ; rep movsb      ; optional if copying more data

    ; write string to stdout
    mov edx, len     ; message length
    mov ecx, s2      ; pointer to message
    mov ebx, 1       ; file descriptor (stdout)
    mov eax, 4       ; sys_write
    int 0x80

    ; exit
    mov eax, 1       ; sys_exit
    xor ebx, ebx     ; exit code 0
    int 0x80

section .data
s1 db 'HELLO, WORLD', 0   ; source string
len equ $-s1              ; length of source string

section .bss
s2 resb 20                ; buffer for destination string

