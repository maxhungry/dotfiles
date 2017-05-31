export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster_mod"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

plugins=(git bundler z tmux)

source $ZSH/oh-my-zsh.sh

[ -r ~/.secrets ] && source ~/.secrets
[ -r ~/.aliases ] && source ~/.aliases

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib"
setopt NO_BEEP

# Vim integration
bindkey -v
export KEYTIMEOUT=1

#keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^R" history-incremental-search-backward

# zle-line-init
# zle-keymap-select

# Allow '[' and ']' for rake tasks
unsetopt nomatch

# Enable color output
autoload -U colors
colors
export CLICOLOR=1

# Vim as visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR=~/.nvm
. "/usr/local/opt/nvm/nvm.sh"
eval "$(rbenv init -)"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Emacs specifics
if [ -n "$INSIDE_EMACS" ]; then
    export TERM=eterm-color
    export PAGER="cat"
else
    export TERM=xterm-256color
    # Manpages in nvim
    export MANPAGER="nvim -c 'set ft=man' -"
fi
