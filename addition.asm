BITS 64

SECTION .data

SECTION .text

GLOBAL _start

_start:
    mov rdi, [rsp + 16]     ; argv[1]
    mov rax, 0

.loop:
    cmp byte [rdi + rax], 0
    je .display

    inc rax
    jmp .loop

.display:
    ; call system `write` (syscall 1)
    mov rsi, rdi
    mov rdi, 1              ; file descriptor 1 = stdout
    mov rdx, rax
    mov rax, 1              ; syscall 1 = `write`
    syscall                 ; call system for display

    ; Leave the program properly
    mov rax, 60             ; syscall 60 = `exit`
    xor rdi, rdi            ; return 0
    syscall                 ; call system for leaving
