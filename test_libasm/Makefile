# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alde-fre <alde-fre@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/13 09:50:09 by alde-fre          #+#    #+#              #
#    Updated: 2024/05/14 13:52:10 by alde-fre         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = lib_tester

all:
	gcc -Wall -Wextra -Werror -g -o $(NAME) *.c -L../ -lasm

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re