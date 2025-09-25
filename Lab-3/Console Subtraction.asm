section .data
    msg1 db "Enter first number: ",0
    len1 equ $-msg1
    msg2 db "Enter second number: ",0
    len2 equ $-msg2
    resultMsg db "Result = ",0
    lenRes equ $-resultMsg
    newline db 10,0

section .bss
    num1 resb 2
    num2 resb 2
    res  resb 2

section .text
    global _start

_start:
    ; Ask for first number
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; Ask for second number
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; Convert ASCII to number
    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'

    ; Subtract
    sub al, bl

    ; Convert back to ASCII
    add al, '0'
    mov [res], al

    ; Print "Result = "
    mov eax, 4
    mov ebx, 1
    mov ecx, resultMsg
    mov edx, lenRes
    int 0x80

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

