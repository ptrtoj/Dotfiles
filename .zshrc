# PATH
# (Link to the intersting discussion about where to put which var: 
# https://unix.stackexchange.com/a/71258)
export PATH="/Users/jeon/.local/bin${PATH:+:$PATH}"
export CPATH="/Users/jeon/.local/bin${CPATH:+:$CPATH}"
export LIBRARY_PATH="/Users/jeon/.local/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
export LD_LIBRARY_PATH="/Users/jeon/.local/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export C_INCLUDE_PATH="/Users/jeon/.local/include${C_INCLUDE_PATH:+:$C_INCLUDE_PATH}"
export CPLUS_INCLUDE_PATH="/Users/jeon/.local/include${CPLUS_INCLUDE_PATH:+:$CPLUS_INCLUDE_PATH}"

# GPG
export GPG_TTY=$(tty)

# Personal configuration
export LANG=en_US.UTF-8

# Aliases
alias v="vim"
