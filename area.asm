; area.asm - cis11 - Compute the area of a circle using integers only (Pi = 27)

	default rel
	global area

	extern printf
	extern scanf

section .data

msg_intro:	db "This area function is fondly brought to you by Abraham Pairo.",10,0
msg_prompt:	db "Please enter the radius of a circle in whole number of meters: ",0
fmt_num:	db "The number %ld was received.",10,0
fmt_area:	db "the area of a circle with  this radius is %ld and %ld/7 square meters.",10,0
msg_return1:	db "The integer part of the area will be returned to the main program.	Please enjoy ",10,0
msg_return2:	db "your circles.",10,0
fmt_read:	db "%ld",0

section .bss
radius: 	resq 1

section .text
area:
	push rbp
	mov rbp, rsp

	mov rdi, msg_intro
	xor eax, eax
	call printf

	mov rdi, msg_prompt
	xor eax, eax
	call printf

	mov rdi, fmt_read
	lea rsi, [rel radius]
	xor eax, eax
	call scanf

	mov rax, qword [rel radius]

	mov rcx, rax
	imul rax, 22
	imul rax, rcx
	cqo
	mov rcx, 7
	idiv rcx

	mov r8, rax
	mov r9, rdx

	mov rdi, fmt_area
	mov rsi, r8
	mov rdx, r9
	xor eax, eax
	call printf

	mov rdi, msg_return1
	xor eax, eax
	call printf
	mov rdi, msg_return2
	xor eax, eax
	call printf

	mov rax, r8

	mov rsp, rbp
	pop rbp
	ret
