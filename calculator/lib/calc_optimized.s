	.file	"calc.c"
	.text
	.p2align 4
	.globl	add
	.type	add, @function
add:
.LFB0:
	.cfi_startproc
	endbr64
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.p2align 4
	.globl	subtract
	.type	subtract, @function
subtract:
.LFB1:
	.cfi_startproc
	endbr64
	subsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE1:
	.size	subtract, .-subtract
	.p2align 4
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB2:
	.cfi_startproc
	endbr64
	mulsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE2:
	.size	multiply, .-multiply
	.p2align 4
	.globl	divide
	.type	divide, @function
divide:
.LFB3:
	.cfi_startproc
	endbr64
	divsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE3:
	.size	divide, .-divide
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
