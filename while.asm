%include "asm_io.inc"

; nasm -f coff while.asm

SECTION .data
    msg: db "Somos todos cruzeiro!", 10 ; Messagem que será repetida
    tam: equ $-msg	; O tamanho da mensagem

SECTION .text
    global _start

%macro while_loop 2
    while:
        mov eax, %1 ; atribui o valor do primeiro parametro ao registrador eax
        loop:
            cmp eax, %2	; verifica se eax (primeiro parametro) é igual ao segundo parametro 
            je fim_while ; Se a condição de cima for verdadeira devemos sair do while (je = jump if equal)
            push eax	; Botar eax na pilha para salvar seu valor	

            mov eax, 4	; Mandando informaçao para o kernel que vamos escrever algo
            mov ebx, 1	; Especificando que sera pelo STDOUT
            mov ecx, msg	; Mandando o msg
            mov edx, tam	; Mandando o tamanho da msg 
            int 0x80	; Fazendo a chamado do kernel

            pop eax	; Pegando novamente o valor de eax da pilha
            add eax, 1	; Incrementa seu valor para a proxima iteração
            jmp loop	; Chama a nova iteração

    fim_while:
        mov eax, 1	; Falando para o kernel que vamos sair
        mov ebx, 0	; Mandando o codigo de saida
        int 0x80	; Fazendo a chamada do kernel
%endmacro

_start:
    while_loop 0, 5


