
# Defaults
setopt HIST_SAVE_NO_DUPS

# Security Measure
# Any token typed inline, like export SOME_API_KEY=… or
# curl -H "Authorization: …", is saved to ~/.zsh_history in
# plain text. Add setopt HIST_IGNORE_SPACE and prefix sensitive
# commands with a space.
setopt HIST_IGNORE_SPACE

# Plugins
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Prompt(pure)
#fpath+=("$(brew --prefix)/share/zsh/site-functions")
#autoload -U promptinit; promptinit
#prompt pure

# Reading List
#https://thevaluable.dev/zsh-install-configure-mouseless/

# Exports
export PATH="${PATH:+$PATH:}$HOME/.local/bin"
export CPATH="$HOME/.local/include${CPATH:+:$CPATH}"
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

### Aliases
#alias v="vim"

# The following lines is for Ollama
alias gs="ollama"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jeon/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
