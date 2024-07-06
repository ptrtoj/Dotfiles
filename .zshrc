# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(
    brew
    git
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Aliases
alias v="nvim"
alias t="tmux"

# PATH
export PATH="/Users/jeon/.local/bin/:$PATH"
export LIBRARY_PATH="/Users/jeon/.local/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="/Users/jeon/.local/include:$C_INCLUDE_PATH"

# GPG
export GPG_TTY=$(tty)

# NVM
export NVM_DIR="/Users/jeon/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

