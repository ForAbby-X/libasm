
section .text
	global ft_strcpy:

ft_strcpy:
	xor rax, rax		; rax = 0
	jmp if

then:
	inc rax

if:
	mov cl, [rsi + rax]	; ah = s2[i]
	mov [rdi + rax], cl	; s1[i] = ah
	cmp cl, 0x0
	jne then

	mov rax, rdi
	ret
