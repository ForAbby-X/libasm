
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// mandatory
int		ft_strlen(char *str);
char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *str1, char *str2);
int		ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);

//bonus
int		ft_atoi_base(char *str, char *base);

int	main(void)
{
	char	input[]	= "01234567891";
	char	base[]	= "0123456789";

	int		result = ft_atoi_base(input, base);

	printf("Input: %s\nBase: %s\n", input, base);
	printf("Result: %d\n", result);

	return 0;
}
