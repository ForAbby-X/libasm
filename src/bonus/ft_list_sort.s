
section .text
	global ft_list_sort:

ft_list_sort:					; R8 = comp_return ; RBX = node ; RCX = comp_func ; RDX = node->next ; RDI = first_param ; RSI = second_param

	mov QWORD r8,	rdi			; save list start
	mov QWORD rbx,	rdi			; set ptr_list to start
	mov QWORD rcx,	rsi			; save functer

.loop:

	cmp QWORD rbx,	0			; if node is NULL
	je .end						; return

	mov QWORD rdx,	[rbx + 8]	; set RDX to node->next
	cmp QWORD rdx,	0			; else if node->next is NULL
	je .end						; return

	mov QWORD rdi,	[rbx]		; set first parameter of comp function
	mov QWORD rsi,	[rdx]		; set second parameter of comp function
	call QWORD rcx				; execute comp function

	cmp rax,		1			; if comp is greater than 0
	jnl .swap					; swap node->value and node->next->value		
	mov QWORD rbx,	[rbx + 8]	; else move to next node

	jmp .loop

.swap:
	mov QWORD rax,		[rbx]		; save node->value to tmp1
	mov QWORD r9,		[rdx]		; save node->next->value to tmp2
	mov QWORD [rbx],	r9
	mov QWORD [rdx],	rax
	mov QWORD rbx,		r8			; go back to start
	
	jmp .loop

.end:
	mov rax,			r8
	ret
