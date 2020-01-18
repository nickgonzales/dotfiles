export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

export LANG=en_US.UTF-8
export DEFAULT_USER=$USER
eval $(dircolors ~/.dircolors)
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export LESS="-XRF"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:./node_modules/.bin"

alias copy='xclip -sel clip'
alias paste='xclip -o -sel clip'

# For device-specific stuff
if [ -f ~/.zshrc-extra ]; then
    source ~/.zshrc-extra
fi