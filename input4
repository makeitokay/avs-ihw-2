	.file	"main.c"
	.intel_syntax noprefix
	.text
	.comm	input,10000,32
	.comm	result,10000,32
	.globl	convert
	.type	convert, @function
convert:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 64
	jle	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 90
	jg	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	add	eax, 32
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, result[rip]
	mov	BYTE PTR [rax+rdx], cl
	jmp	.L4
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 96
	jle	.L5
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	cmp	al, 122
	jg	.L5
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx]
	sub	eax, 32
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, result[rip]
	mov	BYTE PTR [rax+rdx], cl
	jmp	.L4
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, input[rip]
	movzx	edx, BYTE PTR [rax+rdx]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, result[rip]
	mov	BYTE PTR [rax+rcx], dl
.L4:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L6
	nop
	nop
	pop	rbp
	ret
	.size	convert, .-convert
	.section	.rodata
.LC0:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], 0
.L8:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	mov	edx, DWORD PTR -8[rbp]
	mov	ecx, edx
	cdqe
	lea	rdx, input[rip]
	mov	BYTE PTR [rax+rdx], cl
	cmp	DWORD PTR -8[rbp], -1
	jne	.L8
	mov	eax, DWORD PTR -4[rbp]
	sub	eax, 1
	cdqe
	lea	rdx, input[rip]
	mov	BYTE PTR [rax+rdx], 0
	mov	eax, DWORD PTR -4[rbp]
	mov	edi, eax
	call	convert
	lea	rsi, result[rip]
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
