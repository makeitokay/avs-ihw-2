	.intel_syntax noprefix
	.text
	.comm	input,10000,32
	.comm	result,10000,32
	.globl	convert
	.type	convert, @function
convert:
	push	rbp                     # пролог функции convert
	mov	rbp, rsp                    #
	push r12                        # сохраняем регистры на стеке
	push r13                        #
	mov	r12d, edi                   # r12d = size (аргумент функции)
	mov	r13d, 0                     # i = 0
	jmp	.L2
.L6:
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx] # eax = input[i]
	cmp	al, 64                      # input[i] <= 64 ?
	jle	.L3                         # если да, то в .L3
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx] # eax = input[i]
	cmp	al, 90                      # input > 90 ?
	jg	.L3                         # если да, то в .L3
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx] # eax = input[i]
	add	eax, 32                     # eax += 32
	mov	ecx, eax
	mov	eax, r13d                   # eax = i
	lea	rdx, result[rip]
	mov	BYTE PTR [rax+rdx], cl      # result = input[i] + 32
	jmp	.L4
.L3:
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx] # eax = input[i]
	cmp	al, 96                      # input[i] <= 96 ?
	jle	.L5                         # если да, то в .L5
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx] # eax = input[i]
	cmp	al, 122                     # input[i] > 122 ?
	jg	.L5                         # если да, то в .L5
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	eax, BYTE PTR [rax+rdx] # eax = input[i]
	sub	eax, 32                     # eax -= 32
	mov	ecx, eax
	mov	eax, r13d                   # eax = i
	lea	rdx, result[rip]
	mov	BYTE PTR [rax+rdx], cl      # result = input[i] - 32
	jmp	.L4
.L5:
	mov	eax, r13d                   # eax = i
	lea	rdx, input[rip]
	movzx	edx, BYTE PTR [rax+rdx] # edx = input[i]
	mov	eax, r13d                   # eax = i
	lea	rcx, result[rip]
	mov	BYTE PTR [rax+rcx], dl      # result[i] = input[i]
.L4:
	add	r13d, 1                     # i += 1
.L2:
	mov	eax, r13d                   # eax = i
	cmp	eax, r12d                   # i < size ?
	jl	.L6                         # если меньше, то в .L6
	pop r13                         #
	pop r12                         #
	leave                           # эпилог функции convert
	ret                             #
.LC0:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp                     #
	mov	rbp, rsp                    #
	push r12                        # пролог функции main
	push r13                        #
	mov	r12d, 0                     # size = 0
.L8:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax                    # rdi = stdin
	call	fgetc@PLT
	mov	r13d, eax                   # ch = fgetc(stdin)
	mov	eax, r12d                   # eax = size
	lea	edx, 1[rax]
	mov	r12d, edx                   # size += 1
	mov	edx, r13d                   # edx = ch
	mov	ecx, edx
	lea	rdx, input[rip]
	mov	BYTE PTR [rax+rdx], cl      # input[size++] = ch
	cmp	r13d, -1                    # ch != -1 ?
	jne	.L8                         # если да, то в .L8
	mov	eax, r12d                   # eax = size
	sub	eax, 1                      # eax = size - 1
	lea	rdx, input[rip]
	mov	BYTE PTR [rax+rdx], 0       # input[size - 1] = '\0'
	mov	eax, r12d                   # eax = size
	mov	edi, eax                    # edi = size
	call	convert                 # convert(size)
	lea	rsi, result[rip]            # rsi = result
	lea	rdi, .LC0[rip]              # rdi = "%s"
	mov	eax, 0
	call	printf@PLT              # printf("%s", result)
	mov	eax, 0
	pop rbx                         #
	pop r13                         #
	pop r12                         # эпилог функции main
	leave                           #
	ret                             #
