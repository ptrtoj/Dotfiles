# Zshell Settings
setopt HIST_SAVE_NO_DUPS

# Plugins
# zsh-syntax-highlighting
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-autocomplete
#source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# for Prompt(pure)
#fpath+=("$(brew --prefix)/share/zsh/site-functions")
#autoload -U promptinit; promptinit
#prompt pure

# Reading List
#https://thevaluable.dev/zsh-install-configure-mouseless/

# Exports
export PATH="$HOME/.local/bin${PATH:+:$PATH}"
export CPATH="$HOME/.local/bin${CPATH:+:$CPATH}"
export LIBRARY_PATH="$HOME/.local/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
export LD_LIBRARY_PATH="$HOME/.local/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export C_INCLUDE_PATH="$HOME/.local/include${C_INCLUDE_PATH:+:$C_INCLUDE_PATH}"
export CPLUS_INCLUDE_PATH="$HOME/.local/include${CPLUS_INCLUDE_PATH:+:$CPLUS_INCLUDE_PATH}"

#export XDG_CONFIG_HOME="$HOME/.config"
# Don't need, yet and also, when uncommenting, create appropriate directories first
#export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
#export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export GPG_TTY=$(tty)
export LANG=en_US.UTF-8
#export EDITOR="nvim"
#export VISUAL="nvim"

# Aliases
alias v="vim"

