
section .text
	global ft_list_size:

ft_list_size:

	xor rax,	rax				; set list_size to 0

.loop:
	cmp QWORD rdi,	0			; if node is NULL
	je .end						; return

	mov QWORD rdi,	[rdi + 8]	; move to next node
	inc rax						; increment list_size

	jmp .loop

.end:
	ret
