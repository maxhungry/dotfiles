# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster_mod"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

plugins=(git z tmux colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib"
setopt NO_BEEP

export LANG=en_NZ.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Vim integration
bindkey -v
export KEYTIMEOUT=1

#keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^R" history-incremental-search-backward

zle-line-init
# zle-keymap-select

# Allow '[' and ']' for rake tasks
unsetopt nomatch

# Enable color output
autoload -U colors
colors
export CLICOLOR=1

# Vim as visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Alias
alias ls='ls -GFh'
alias ember="./node_modules/.bin/ember"
alias git=hub

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
eval "$(rbenv init -)"
