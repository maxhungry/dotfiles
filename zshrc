export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

plugins=(git bundler z tmux)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib"
export KEYTIMEOUT=1
export CLICOLOR=1
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=screen-256color
export MANPAGER="nvim -c 'set ft=man' -"

unsetopt nomatch # Allow '[' and ']' for rake tasks
setopt NO_BEEP
bindkey -v
autoload -U colors # Enable color output
colors

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^R" history-incremental-search-backward

# nvm
export NVM_DIR=~/.nvm
. "/usr/local/opt/nvm/nvm.sh"

# rbenv
eval "$(rbenv init -)"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# fasd
eval "$(fasd --init auto)"

[ -r ~/.sh.d/aliases ] && source ~/.sh.d/aliases
[ -r ~/.sh.d/secrets ] && source ~/.sh.d/secrets
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Spaceship configs
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_RUBY_SYMBOL="●"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
