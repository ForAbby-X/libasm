
section .text
	global ft_atoi_base:
	
	extern __errno_location
	extern ft_strlen

ft_atoi_base:
	mov rbx, rdi	; save the pointer to the string (RBX = STRING)

	mov rdi, rsi	; RDI = BASE
	call ft_strlen	; RAX = strlen(BASE)

	cmp rax, 0
	je .error

	mov rdi, rbx	; RDI = STRING


	xor rbx, rbx	; RBX = 0
	xor rcx, rcx	; RCX = 0

	jmp .loop

	; RDI = STRING ; RSI = BASE ; RAX = BASE_LEN ; RBX = INDEX ; RCX = RESULT
	
.loop:
	

	inc rbx


	ret

.error:
	mov rax, 0
	ret
