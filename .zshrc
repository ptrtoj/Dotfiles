# PATH
export PATH="/Users/jeon/.local/bin:$PATH"
export LIBRARY_PATH="/Users/jeon/.local/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="/Users/jeon/.local/include:$C_INCLUDE_PATH"

# GPG
export GPG_TTY=$(tty)

# User configuration
export LANG=en_US.UTF-8

# Aliases
alias n="nvim"
alias v="nvim"

# Zsh plugins
## zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## zsh-autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

## zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
