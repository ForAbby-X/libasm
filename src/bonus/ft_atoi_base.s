
section .text
	global ft_atoi_base:


ft_atoi_base:				; RDI = STRING ; RSI = BASE
	xor rax, rax			; RAX = 0
	jmp .bc_inner_loop

.bc_char_loop:
	cmp [rcx], BYTE 0x0		; if end of base
	je .bc_inner_inc		; increment input index

	mov bl, BYTE rsi[rax]
	cmp BYTE [rcx], bl		; if duplicates in base
	je .error_ret			; return error

	inc rcx					; inc base index
	jmp .bc_char_loop		; loop back

.bc_inner_inc:
	inc rax					; incremenet input index
.bc_inner_loop:
	cmp rsi[rax], BYTE 0x0	; if end of input
	je .bc_end				; save base len

	mov rcx, rsi
	add rcx, rax
	inc rcx
	
	cmp [rcx], BYTE 0x0		; if possible duplicates in base
	jne .bc_char_loop		; check if there is any

	jmp .bc_inner_inc		; if not loop back and increment input index 

.bc_end:
	cmp rax, 2				; if base length is equal to 0 
	jl .error_ret			; return error

	mov rcx, rax			; RCX = BASE_LEN
	xor rax, rax			; RAX = 0
	jmp .main_loop			;


.main_loop:					; RDI = STRING ; RSI = BASE; RCX = BASE_LEN; RBX = BASE_INDEX; RAX = VALUE
	cmp [rdi], BYTE 0x0		; if end of input
	je .success_ret			; return success
	
	xor rbx, rbx
.main_find:
	cmp rsi[rbx], BYTE 0x0	; if char not found
	je .success_ret		; return number

	mov dl, rsi[rbx]
	cmp [rdi], dl			; if char found
	je .main_end			; leave loop

	inc rbx
	jmp .main_find

.main_end:
	mul rcx
	add rax, rbx			; value = value * base_len + base_index

	inc rdi
	jmp .main_loop

.success_ret:
	ret

.error_ret:
	mov rax, 0
	ret
