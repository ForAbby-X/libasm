
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
}	t_list;

// mandatory
int		ft_strlen(char *str);
char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *str1, char *str2);
int		ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);

//bonus
int		ft_atoi_base(char *str, char *base);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *list);
t_list	*ft_list_sort(t_list *lst, int (*cmp)());


void	list_print(t_list *list_ptr)
{
	int	*value;

	if (!list_ptr)
		printf("(EMPTY LIST)\n");
	while (list_ptr)
	{
		value = list_ptr->data;
		printf("%d", *value);
		if (list_ptr->next)
			printf(", ");
		else
			printf("\n");
		list_ptr = list_ptr->next;
	}
}

int	cmp_fun(int a, int b)
{
	return (a < b);
}

int	main(void)
{
	// test atoi_base
	{
		char	input[]	= "01234567891";
		char	base[]	= "0123456789";

		int		result = ft_atoi_base(input, base);

		printf("Input: %s\nBase: %s\n", input, base);
		printf("Result: %d\n", result);
	}

	// test list_push_front
	{
		t_list	*my_list = NULL;

		list_print(my_list);
		printf("ADDR: %p\n", my_list);

		printf("SIZE: %d\n", ft_list_size(my_list));

		ft_list_push_front(&my_list, &(int){ 1 });
		ft_list_push_front(&my_list, &(int){ 2 });

		printf("SIZE: %d\n", ft_list_size(my_list));

		ft_list_push_front(&my_list, &(int){ 3 });
		ft_list_push_front(&my_list, &(int){ 4 });
		ft_list_push_front(&my_list, &(int){ 5 });

		printf("SIZE: %d\n", ft_list_size(my_list));

		list_print(my_list);
		printf("ADDR: %p\n", my_list);

		printf("SORT: %p\n", ft_list_sort(my_list, &cmp_fun));
		printf("ADDR: %p\n", my_list);

		list_print(my_list);
	}

	return (0);
}
