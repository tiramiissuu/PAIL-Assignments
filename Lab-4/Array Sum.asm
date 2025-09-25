section .data
x:      db 1,2,3,1,2
sum:    db 0, 0xa    ; store sum + newline

section .text
global _start

_start:
    mov esi, x        ; pointer to array
    mov ecx, 5        ; number of elements
    xor ebx, ebx      ; sum = 0

sum_loop:
    add bl, [esi]     ; add byte to sum
    inc esi
    loop sum_loop

    add bl, '0'       ; convert sum to ASCII
    mov [sum], bl

    ; write sum
    mov edx, 2        ; 1 char + newline
    mov ecx, sum
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

