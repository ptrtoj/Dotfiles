# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Alias

# PATH
export PATH="/Users/jeon/.local/bin/:/opt/gcc-14.1.0-aarch64/bin:$PATH"
export LIBRARY_PATH="/Users/jeon/.local/lib:$LIBRARY_PATH"
export C_INCLUDE_PATH="/Users/jeon/.local/include:$C_INCLUDE_PATH"

# GPG
export GPG_TTY=$(tty)

# Nvm
export NVM_DIR="/Users/jeon/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
