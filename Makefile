#	---------------------MAIN----------------------#
NAME = libft.a
CC = cc
INCLUDE_DIR = ./include
CFLAGS = -Wall -Wextra -Werror -I $(INCLUDE_DIR)

#	---------------------Sources----------------------#
VPATH = ./libft ./printf ./get_next_line
SOURCES_LIBFT = \
			ft_atoi.c	\
			ft_atol.c \
			ft_isalpha.c \
			ft_isdigit.c \
			ft_isalnum.c \
			ft_isascii.c \
			ft_isprint.c \
			ft_toupper.c \
			ft_tolower.c \
			ft_memset.c \
			ft_bzero.c \
			ft_memcpy.c \
			ft_memmove.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_strlen.c \
			ft_strlcpy.c \
			ft_strlcat.c \
			ft_strchr.c \
			ft_strrchr.c \
			ft_strncmp.c \
			ft_strnstr.c \
			ft_strdup.c \
			ft_substr.c \
			ft_calloc.c \
			ft_itoa.c \
			ft_strjoin.c \
			ft_strtrim.c \
			ft_strmapi.c \
			ft_striteri.c \
			ft_putchar_fd.c \
			ft_putstr_fd.c \
			ft_strmapi.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_split.c \
			ft_lstnew.c \
			ft_lstsize.c \
			ft_lstlast.c \
			ft_lstadd_front.c \
			ft_lstadd_back.c \
			ft_lstdelone.c \
			ft_lstclear.c \
			ft_lstiter.c \
			ft_lstmap.c \

SOURCES_PRINTF = \
			ft_printf_func.c \
			ft_printf_func2.c \
			ft_printf.c \

SOURCES_GNL = \
			get_next_line.c \
			get_next_line_utilis.c \

SOURCES_GNL_mfd = \
			get_next_line_bonus.c \
			get_next_line_utilis.c \


#-----------OBJECTS----------------------#
OBJECTS_DIR = objects
SOURCES = $(SOURCES_LIBFT) $(SOURCES_PRINTF) $(SOURCES_GNL) $(SOURCES_GNL_mfd)
OBJECTS = $(addprefix $(OBJECT_DIR)/, $(SOURCES:.c=.0))

# ---------- COLORS AND STUFF ---------- #
Color_Off = \033[0m
BIYellow = \033[1;93m
Yellow = \033[0;33m
BGreen = \033[1;32m 
On_Yellow = \033[43m
On_Green = \033[42m
Red = \033[0;31m

TOTAL_SOURCES = $(word $(SOURCES))
CURRENT = 0


#	---------------------Sources----------------------#

all: $(NAME)

$(NAME): $(MY_OBJECTS)
	@echo "$(BIYellow) Compiling $(NAME) $(Color_Off)"
	$(AR) -rcs $(NAME) $(CFLAGS) $(OBJECTS)
	@if [ -f $(NAME) ]; then \
		echo "$(On_Yellow)------------------------------------------$(Color_Off)"; \
		echo "$(BGreen)PROCESS COMPLETED SUCCESSFULLY!$(Color_Off)"; \
		echo "$(On_Green)------------------------------------------$(Color_Off)"; \
	else \
		echo "$(Red)failed to compile $(NAME) $(Color_Off)"; \
		exit 1; \
	fi

$(OBJECT_DIR)/%.o: %.c | $(OBJECT_DIR)
	@$(eval CURRENT := $(shell echo $$(($(CURRENT) + 1))))
	@$(eval PERCENT := $(shell echo $$(($(CURRENT) * 100 / $(TOTAL_SRCS)))))
	@printf "$(CLEAR_LINE)$(BIYellowY)Compiling $(PERCENT)%% [$(CURRENT)/$(TOTAL_SRCS)] $(BGreen)$<$(NC)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJECT_DIR):
	@echo "(BIYellow) Created $(OBJECT_DIR) Directory $(Color_Off)"
	@mkdir -p $(OBJECT_DIR)


clean: 
	@echo "$(Red)Cleaning object file$(Color_Off)"
	rm -rf $(OBJECT_DIR)


fclean: clean 
	rm -f $(NAME)

re: fclean all 

.PHONY: re clean fclean all