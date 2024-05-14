
section .text
	global ft_strdup:
	
	extern malloc
	extern ft_strlen
	extern ft_strcpy

ft_strdup:
	mov rbx, rdi	; save the pointer to the string (RBX = STRING)
	call ft_strlen

	inc rax
	mov rdi, rax
	call malloc wrt ..plt

	cmp rax, 0
		je end

	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy

end:
	ret