# 42_MINISHELL

Goal

    - Mandatory : Write a mini shell :
      - handle redirections : < , << , > , >>
      - handle pipes
      - handle environment variables and $?
      - handle SIGINT, SIGQUIT and EOF like in bash
      - implements builtins (cd with relative or absolute path, echo and option -n, export no options, exit no options, env no options, pwd no options, unset no options) 
    - Bonus : Implement && and || operators, and wildcards for current directory
    
Launch

    - Compile with the makefile
    
    - Interactive way : launch ./minishell
    - Non Interactive way : launch echo "<cmd + arguments>" | ./minishell
    
Authorized functions

    - readline, rl_clear_history, rl_on_new_line, rl_replace_line, rl_redisplay, add_history
    - printf, malloc, free, write, access, open, read, close, unlink, exit
    - fork, dup, dup2, pipe, execve, wait, waitpid, wait3, wait4 
    - signal, sigaction, sigemptyset, sigaddset, kill
    - tcsetattr, tcgetattr, tgetent, tgetflag, tgetnum, tgetstr, tgoto, tputs
    - opendir, readdir, closedir
    - getcwd, chdir, stat, lstat, fstat, getenv
    - strerror, perror, isatty, ttyname, ttyslot, ioctl,
    - megalibft

What is forbidden

    - Function lseek
    - Global variables
    - for
    - do ... while
    - switch
    - case
    - goto
    - Ternary operators
    - Variable-size tables

The project must be written in accordance with the 42's Norm
