
section .text
	global ft_strcmp:

ft_strcmp:
	xor rax, rax		; rax = 0
	jmp if

then:
	inc rax

if:
	mov bl, BYTE [rdi + rax]	; s1[i]
	mov bh, BYTE [rsi + rax]	; s2[i]

	cmp bl, 0
	je end
	cmp bh, 0
	je end
	cmp bl, bh
	je then

end:
	sub bl, bh
	movsx rax, bl
	ret
