; area.asm - CIS-11 - Compute the area of a circle using integers only (Pi = 22/7)

        default rel
        global area

        extern printf
        extern libPuhfessorP_inputSignedInteger64
        extern libPuhfessorP_printSignedInteger64

section .data

msg_intro:    db "This area function is fondly brought to you by Abraham Pairo.",10,0
msg_prompt:   db "Please enter the radius of a circle in whole number of meters: ",0
msg_return1:  db "The integer part of the area will be returned to the main program.  Please enjoy ",10,0
msg_return2:  db "your circles.",10,0

msg_num1:     db "The number ",0
msg_num2:     db " was received.",10,0
msg_area1:    db "The area of a circle with this radius is ",0
msg_and:      db " and ",0
msg_sq:       db "/7 square meters.",10,0

section .bss

radius:       resq 1

section .text

area:
        push rbp
        mov  rbp, rsp

        mov  rdi, msg_intro
        xor  eax, eax
        call printf

        mov  rdi, msg_prompt
        xor  eax, eax
        call printf

        call libPuhfessorP_inputSignedInteger64
        mov  qword [rel radius], rax

        mov  rdi, msg_num1
        xor  eax, eax
        call printf
        mov  rdi, rax
        call libPuhfessorP_printSignedInteger64
        mov  rdi, msg_num2
        xor  eax, eax
        call printf

        mov  rax, qword [rel radius]
        mov  rcx, rax
        imul rax, 22
        imul rax, rcx
        cqo
        mov  rcx, 7
        idiv rcx

        mov  r8, rax
        mov  r9, rdx

        push r8
        push r9

        mov  rdi, msg_area1
        xor  eax, eax
        call printf

        mov  rax, [rsp+8]
        mov  rdi, rax
        call libPuhfessorP_printSignedInteger64

        mov  rdi, msg_and
        xor  eax, eax
        call printf

        mov  rax, [rsp]
        mov  rdi, rax
        call libPuhfessorP_printSignedInteger64

        mov  rdi, msg_sq
        xor  eax, eax
        call printf

        mov  rax, [rsp+8]
        add  rsp, 16

        mov  rdi, msg_return1
        xor  eax, eax
        call printf
        mov  rdi, msg_return2
        xor  eax, eax
        call printf

        mov  rsp, rbp
        pop  rbp
        ret

