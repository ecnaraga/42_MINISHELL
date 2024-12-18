# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: galambey <galambey@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 11:40:45 by galambey          #+#    #+#              #
#    Updated: 2023/08/31 16:57:42 by galambey         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell
CC = cc
C_FLAGS = -Wall -Wextra -Werror -g3 -MMD
LIB_FLAGS = -lreadline
INC_LIBFT = ./libft/megalibft.a

################################### SOURCES ###################################

BUILTIN_DIR         	=   builtin/
BUILTIN_SRCS        	=   builtin.c \
							builtin_echo.c \
							builtin_pwd.c \
							builtin_export.c \
							builtin_export_utils.c \
							builtin_export_utils_bis.c \
							builtin_export_utils_ter.c \
							builtin_unset.c \
							builtin_env.c \
							builtin_cd.c \
							builtin_cd_utils.c \
							builtin_exit.c \
							builtin_exit_utils.c \
							get_env.c \
							get_env_utils.c \
							get_export_env.c

EXEC_DIR       			=   exec/
EXEC_SRCS      			=   exec.c \
							exec_cmd.c \
							exec_error.c \
							exec_exit.c

EXEC_UTILS_DIR     		=   exec_utils/
EXEC_UTILS_SRCS    		=   exec_utils.c \
							exec_utils_bis.c \
							exec_utils_ter.c \
							exec_utils_four.c \
							exec_make_cmd.c \
							exec_make_cmd_utils.c

EXPAND_DIR        		=   expand/
EXPAND_SRCS       		=   ft_expand.c \
							ft_expand_utils.c \
							ft_expand_utils_bis.c

GARBAGGE_DIR       		=   garbagge/
GARBAGGE_SRCS      		=   ft_magic_malloc.c \
							ft_magic_malloc_utils.c \
							ft_magic_malloc_utils_bis.c

HEREDOC_DIR     		=   heredoc/
HEREDOC_SRCS    		=   heredoc.c \
							heredoc_utils.c \
							heredoc_utils_bis.c

MAIN_DIR     			=   main/
MAIN_SRCS    			=   main.c \
	   						minishell.c

PARENTHESIS_DIR     	=   parenthesis/
PARENTHESIS_SRCS    	=   exec_par.c \
	   						exec_par_utils.c

PARSING_DIR     		=   parsing/
PARSING_SRCS    		=   ft_parse_str.c \
	   						ft_parse_str_bis.c \
	   						ft_parse_str_ter.c \
	   						ft_parse_par_storage.c \
							ft_parse_par.c \
	   						ft_parse_par_utils.c \
	   						ft_parse_token.c \
	   						ft_parse_error_token.c \
	   						ft_parse_error_token_utils.c \
	   						ft_parse_utils.c \
	   						ft_error_message_syntax.c \
	   						ft_split_minish_utils.c \
	   						ft_split_minish_utils_bis.c \
	   						ft_split_minish.c \
	   						ft_strlcpy_minish.c \
	   						ft_strlcpy_minish_utils.c

PIPEX_DIR   	  		=   pipex/
PIPEX_SRCS  	  		=   pipex.c \
	   						pipex_handle_pipe.c

REDIR_DIR     			=   redir/
REDIR_SRCS    			=   exec_std_utils.c \
	   						exec_stdin.c \
	   						exec_stdin_utils.c \
	   						exec_stdout.c \
	   						exec_stdout_utils.c

SIGNAL_DIR     			=   signal/
SIGNAL_SRCS    			=   signal.c \
	   						signal_bis.c

UTILS_DIR     			=   utils/
UTILS_SRCS    			=   ft_split_magic_malloc.c \
							ft_split_magic_isspace.c \
							ft_strtrim_msh.c \
							ft_split_minish_lst.c \
							ft_split_minish_lst_bis.c \
							lpid_utils.c

WILDCARDS_DIR     		=   wildcards/
WILDCARDS_SRCS    		=   ft_expand_wildcard.c \
	   						wildcards.c \
	   						wildcards_utils.c

############################# HANDLE DIRECTORIES ##############################

SRCS_DIR        	=     srcs/

SRCS				=	$(addprefix $(BUILTIN_DIR), $(BUILTIN_SRCS)) \
						$(addprefix $(EXEC_DIR), $(EXEC_SRCS)) \
						$(addprefix $(EXEC_UTILS_DIR), $(EXEC_UTILS_SRCS)) \
						$(addprefix $(EXPAND_DIR), $(EXPAND_SRCS)) \
						$(addprefix $(GARBAGGE_DIR), $(GARBAGGE_SRCS)) \
						$(addprefix $(HEREDOC_DIR), $(HEREDOC_SRCS)) \
						$(addprefix $(MAIN_DIR), $(MAIN_SRCS)) \
						$(addprefix $(PARENTHESIS_DIR), $(PARENTHESIS_SRCS)) \
						$(addprefix $(PARSING_DIR), $(PARSING_SRCS)) \
						$(addprefix $(PIPEX_DIR), $(PIPEX_SRCS)) \
						$(addprefix $(REDIR_DIR), $(REDIR_SRCS)) \
						$(addprefix $(SIGNAL_DIR), $(SIGNAL_SRCS)) \
						$(addprefix $(UTILS_DIR), $(UTILS_SRCS)) \
						$(addprefix $(WILDCARDS_DIR), $(WILDCARDS_SRCS)) \

OBJS_DIR 			= 	objs/

OBJS_NAMES 			= 	$(SRCS:.c=.o)

OBJS_FOLDER			=	$(addprefix $(OBJS_DIR), $(BUILTIN_DIR) \
                        $(EXEC_DIR) \
                        $(EXEC_UTILS_DIR) \
						$(EXPAND_DIR) \
                        $(GARBAGGE_DIR) \
                        $(HEREDOC_DIR) \
                        $(MAIN_DIR) \
                        $(PARENTHESIS_DIR) \
                        $(PARSING_DIR) \
                        $(PIPEX_DIR) \
                        $(REDIR_DIR) \
                        $(SIGNAL_DIR) \
                        $(UTILS_DIR) \
                        $(WILDCARDS_DIR))

OBJS			= $(addprefix $(OBJS_DIR), $(OBJS_NAMES))

DEPS := $(OBJS:.o=.d)

#################################### RULES ####################################

DIR_DUP     = mkdir -p $(@D)

all : $(NAME)

$(OBJS_DIR)%.o:$(SRCS_DIR)%.c
	mkdir -p $(@D)
	$(CC) $(C_FLAGS) -c $< -o $@

$(NAME) : $(OBJS)
	make -j -C ./libft
	$(CC) $(C_FLAGS) $(OBJS) $(INC_LIBFT) $(LIB_FLAGS) -o $@

-include $(DEPS)

clean :
	make -j clean -C ./libft
	rm -rf $(OBJS_DIR)

fclean : clean
	make -j fclean -C ./libft
	rm -f minishell

re : fclean
	make all

.PHONY : all clean fclean re