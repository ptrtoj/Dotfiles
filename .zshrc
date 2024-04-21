# for GnuPG in terminal
export GPG_TTY=$(tty)

# for NVIM to manage NodeJS versions
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PATH
## /Applications/Racket v8.12/bin/racket	: for SICP/SCHEME/Dr.Racket
## /Users/jeon/.local/bin			: for Alire/ADA
export PATH="/Applications/Racket v8.12/bin:/Users/jeon/.local/bin:$PATH"
