##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## LD_LIBRARY_PATH=$PWD ./a.out
##

SRC	=	addition.asm

NAME	=	calcul

OBJ	=	$(SRC:.asm=.o)

all:
	nasm -f elf64 $(SRC)
	ld -s -o $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
