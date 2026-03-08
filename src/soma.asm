section .data  
msg db "Result is: "
msglen equ $-msg
newline db 10

section .bss 
buffer resb 32 

section .text 
global _start

_start: 

    mov rdi,  7 
    mov rsi, 5
    call soma 

    mov rdi, rax 
    call int_to_string 

    mov r8, rdx

    mov rax, 1
    mov rdi, 1 
    mov rsi, msg 
    mov rdx, msglen
    syscall 

    mov rax, 1 
    mov rdi, 1 
    syscall 

    mov rax, 1 
    mov rdi, 1 
    mov rsi, newline 
    mov rdx, 1
    syscall 

    mov rax, 60
    mov rdi, rdi 
    syscall 


soma: 

    mov rax, rdi 
    add rax, rsi 
    ret 

int_to_string:

    mov rcx, buffer 
    add rcx, 31                         ; Aponta para o final do buffer, adicinei corretamente o valor para evitar sobrescrever o último byte do buffer
    mov byte [rcx], 0 
    mov rbx, 10

.loop:

    xor rdx, rdx 
    mov rax, rdi
    div rbx

    add rdx, '0' 
    dec rcx 
    mov [rcx], dl 

    mov rdi, rax
    test rax, rax 
    jnz .loop 

    mov rsi, rcx 
    sub rdx, buffer 
    add rdx, 31 
    sub rdx, rcx

    ret 

.convert:

    mov rax, rdi
    xor rdx, rdx
    mov rbx, 0 
    div rbx

    add rdx, '0'
    dec rcx
    mov [rcx], dl

    mov rdi, rax
    test rax, rax
    jnz .convert

    mov rsi, rcx
    mov rdi, buffer 

; .copy:

    ; mov al, [rsi]
    ; mov [rdi], al
    ; inc rsi
    ; inc rdi
    ; cmp al, 0 
    ; jne .copy

    ; ret

; Este código é um exemplo simples de uma função de soma e uma função para converter um inteiro em string. Ele utiliza chamadas de sistema para imprimir o resultado na tela. Note que a função de soma está incorreta, pois não está realizando a operação de adição corretamente. O código precisa ser corrigido para funcionar corretamente.
; A função de soma deve ser corrigida para realizar a operação de adição corretamente, utilizando a instrução `add` em vez de `mov`. Além disso, a função `int_to_string` precisa ser ajustada para lidar corretamente com a conversão de inteiros para strings.