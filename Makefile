# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wremelli <nremelli@gmail.com>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/20 11:50:58 by wremelli          #+#    #+#              #
#    Updated: 2024/01/22 14:42:00 by wremelli         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME				= push_swap

INC					= inc/
SRC_DIR				= srcs/
OBJ_DIR				= obj/

CC					= gcc
CFLAGS				= -Wall -Werror -Wextra -I
RM					= rm -f

COMMANDS_DIR		=	$(SRC_DIR)commands/push.c \
						$(SRC_DIR)commands/rev_rotate.c \
						$(SRC_DIR)commands/rotate.c \
						$(SRC_DIR)commands/sort_stacks.c \
						$(SRC_DIR)commands/sort_three.c \
						$(SRC_DIR)commands/swap.c

PUSH_SWAP_DIR		=	$(SRC_DIR)push_swap/handle_errors.c \
						$(SRC_DIR)push_swap/init_a_to_b.c \
						$(SRC_DIR)push_swap/init_b_to_a.c \
						$(SRC_DIR)push_swap/main.c \
						$(SRC_DIR)push_swap/split.c \
						$(SRC_DIR)push_swap/stack_init.c \
						$(SRC_DIR)push_swap/stack_utils.c \
						$(SRC_DIR)push_swap/utils.c

SRCS 				= $(COMMANDS_DIR) $(PUSH_SWAP_DIR)

OBJ 				= $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRCS))

start:				
					@make all

all: 				$(NAME)

$(NAME): 			$(OBJ)
					@$(CC) $(CFLAGS) $(INC) $(OBJ) -o $(NAME)

$(OBJ_DIR)%.o:		$(SRC_DIR)%.c 
					@mkdir -p $(@D)
					@$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean:
					@$(RM) -r $(OBJ_DIR)
					
fclean: 			clean
					@$(RM) $(NAME)

re: 				fclean all

.PHONY: 			start all clean fclean re