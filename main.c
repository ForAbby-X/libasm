
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int		ft_strlen(char *str);
char	*ft_strcpy(char *dest, char *src);
int		ft_strcmp(char *str1, char *str2);
int		ft_write(int fd, const void *buf, size_t count);
int		ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);

int	main(void)
{
	char	str[]	= "Hello, Worldfsdjfjdsfdjksd!fffffffffffffffffffffffffff";
	char	str2[]	= "Hello, Worldfsdjfjdsfdjksd!fddddd";
	char	tmp[128];
	char	*tmp2;
	int		len;
	
	tmp2 = ft_strcpy(tmp, str);

	len = ft_strlen(tmp2);
	printf("Length of string: %d\n", len);

	printf("Compare FAKE string: %d\n", ft_strcmp(str, str2));
	printf("Compare REAL string: %d\n", strcmp(str, str2));
	printf("Compare string: %d\n", 'd' - 'H');

	ft_write(1, "Hello, World!\n", 14);

	ssize_t siz = ft_read(0, tmp, 128);
	tmp[siz] = '\0';

	printf("Read: %s\n", tmp);

	tmp2 = ft_strdup(str);
	printf("From string: %s\n", str);
	printf("Duplicated string: %s\n", tmp2);

	free(tmp2);

	return 0;
}
