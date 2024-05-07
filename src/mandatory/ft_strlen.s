
section .text
	global ft_strlen:

ft_strlen:
	xor rax, rax
	jmp if

then:
	inc rax

if:
	mov cl, [rdi + rax]
	cmp cl, 0x0
	jne then
	
	ret
