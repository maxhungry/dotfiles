export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster_mod"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

plugins=(git bundler z tmux)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib"
export KEYTIMEOUT=1
export CLICOLOR=1
export VISUAL=nvim
export EDITOR=$VISUAL

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

# Emacs specifics
if [ -n "$INSIDE_EMACS" ]; then
    export TERM=eterm-color
    export PAGER="cat"
else
    export TERM=xterm-256color
    # Manpages in nvim
    export MANPAGER="nvim -c 'set ft=man' -"
fi

[ -r ~/.sh.d/aliases ] && source ~/.sh.d/aliases
[ -r ~/.sh.d/secrets ] && source ~/.sh.d/secrets
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
