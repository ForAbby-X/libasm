
typedef struct s_list
{
	void *data;
	struct s_list *next;
} t_list;

struc   mystruct
	d:	resd	8
	e:	resb	8
endstruc


section .text
	global ft_list_push_front:

	extern malloc

ft_list_push_front:
	
	mov rbx, rdi			; save list head (**) to rbx

	mov rdi, 16				; sizeof t_list node
	call malloc wrt ..plt	; get malloc'ed result in rax

	

	ret
