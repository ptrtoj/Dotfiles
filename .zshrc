# PATH
export PATH="/Users/jeon/.local/bin:$PATH"
export LIBRARY_PATH="/Users/jeon/.local/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="/Users/jeon/.local/include:$C_INCLUDE_PATH"

# GPG
export GPG_TTY=$(tty)

# Personal configuration
export LANG=en_US.UTF-8

# Aliases
alias n="nvim"
alias v="vim"

# Prompt
# after doing '$npm install -g typewritten',
# below is auto inserted.
# ('$brew install typewritten' might also work,
# but currently, doesn't work for my machine :/)
fpath=($fpath "/Users/jeon/.zfunctions")
autoload -U promptinit; promptinit
prompt typewritten
