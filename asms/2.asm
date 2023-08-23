global _start
section .data
  msg db 'Enter your num: ', 0
  buffer db 100
  buflen equ $ - buffer

section .text
_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg
  mov rdx, 16
  syscall

  mov rax, 0          ; syscall number for sys_read
  mov rdi, 0          ; file descriptor for stdin
  mov rsi, buffer     ; pointer to the buffer
  mov rdx, buflen     
  syscall

  mov rax, 1          ; syscall number for sys_write
  mov rdi, 1          ; file descriptor for stdout
  mov rsi, buffer     ; pointer to the buffer
  add buffer, buffer
  mov rdx, rax        ; length of the input (returned by sys_read)
  syscall

  mov rax, 60
  xor rdi, rdi
  syscall
