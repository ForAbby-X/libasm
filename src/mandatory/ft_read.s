
section .text
	global ft_read:
	
	extern __errno_location

ft_read:
	mov rax, 0x00
	syscall

	cmp rax, 0
	jl error
	ret

error:
	mov rbx, rax
	call __errno_location wrt ..plt
	mov [rax], rbx
	mov rax, -1
	ret
