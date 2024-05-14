
section .text
	global ft_list_push_front:

	extern malloc

ft_list_push_front:

	mov QWORD rbx,		rdi			; save list head reference (**) to RBX

	mov rdi, 16						; sizeof t_list node
	call malloc wrt ..plt			; get malloc'ed result in RAX

	cmp rax, 0						; if malloc failed
	je .end							; return error

	mov QWORD [rax],		rsi		; set data value

	mov QWORD rcx,			[rbx]	; dereference the head reference (*)
	mov QWORD [rax + 8],	rcx		; set next value to head (RCX)

	mov QWORD [rbx],		rax		; change the head to newly allocated memory

.end:
	ret
