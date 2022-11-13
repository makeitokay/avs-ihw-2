	.intel_syntax noprefix
	.text
	.comm	input,10000,32
	.comm	result,10000,32
	.globl	convert
	.type	convert, @function
convert:
	push	rbp
	mov	rbp, rsp
	push r12
	push r13
	mov	r12d, edi
	mov	r13d, 0
	jmp	.L2
.L6:
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L3
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jg	.L3
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	add	eax, 32
	mov	ecx, eax
	mov	eax, r13d
	lea	rdx, result[rip]
	mov	BYTE PTR [rax+rdx], cl
	jmp	.L4
.L3:
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 96
	jle	.L5
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 122
	jg	.L5
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	sub	eax, 32
	mov	ecx, eax
	mov	eax, r13d
	lea	rdx, result[rip]
	mov	BYTE PTR [rax+rdx], cl
	jmp	.L4
.L5:
	mov	eax, r13d
	lea	rdx, input[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	mov	eax, r13d
	lea	rcx, result[rip]
	mov	BYTE PTR [rax+rcx], dl
.L4:
	add	r13d, 1
.L2:
	mov	eax, r13d
	cmp	eax, r12d
	jl	.L6
	pop r13
	pop r12
	leave
	ret
.LC0:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push r12
	push r13
	mov	r12d, 0
.L8:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	r13d, eax
	mov	eax, r12d
	lea	edx, 1[rax]
	mov	r12d, edx
	mov	edx, r13d
	mov	ecx, edx
	lea	rdx, input[rip]
	mov	BYTE PTR [rax+rdx], cl
	cmp	r13d, -1
	jne	.L8
	mov	eax, r12d
	sub	eax, 1
	lea	rdx, input[rip]
	mov	BYTE PTR [rax+rdx], 0
	mov	eax, r12d
	mov	edi, eax
	call	convert
	lea	rsi, result[rip]
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	pop rbx
	pop r13
	pop r12
	leave
	ret
