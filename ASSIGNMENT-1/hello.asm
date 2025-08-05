global _start

section .data
    hello db "Hello, World", 10
    length equ $ - hello

section .text

_start:
    mov eax, 4				; write to file
    mov ebx, 1				; STDOUT handle
    mov ecx, hello			; our message
    mov edx, length			; size of our message
    int 0x80				; execute the syscall

    xor ebx, ebx			; send 0 as 'exit code'
    mov eax,1				; terminate process
    int 0x80				; execute the syscall
    
