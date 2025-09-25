section .data
    array1 db 2, 3, 4, 1
    array2 db 3, 1, 2, 5
    result db 4 dup(0)     ; buffer for sum
    len equ 4
    msg db "Sum = ",0
    newline db 10,0

section .text
    global _start

_start:
    mov ecx, len        ; loop counter
    xor esi, esi        ; index

sum_loop:
    mov al, [array1+esi]
    add al, [array2+esi]  ; add array elements
    daa                    ; decimal adjust AL (for BCD) — optional for result < 10
    mov [result+esi], al
    inc esi
    loop sum_loop

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 6
    int 0x80

    mov ecx, len
    xor esi, esi
print_loop:
    mov al, [result+esi]
    add al, '0'
    mov [result+esi], al
    mov eax, 4
    mov ebx, 1
    lea ecx, [result+esi]
    mov edx, 1
    int 0x80
    inc esi
    loop print_loop

    ; newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

