global _start
section .data
msg db 'Hello Man\n', 0

section .text
_start:
        mov rax, 1
        mov rdi, 1
        mov rsi, msg
        mov rdx, 13
        syscall

        mov rax, 60
        xor rdi, rdi
        syscall

