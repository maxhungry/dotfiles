ZSH_THEME="spaceship"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_GRADLE_SHOW=false

plugins=(git bundler tmux git-flow git-hubflow kubectl docker)

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

unsetopt nomatch # Allow '[' and ']' for rake tasks
setopt NO_BEEP
autoload -U colors # Enable color output
colors

# autoload -Uz compinit && compinit
# autoload bashcompinit && bashcompinit

source $HOME/.oh-my-zsh/oh-my-zsh.sh

bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^R" history-incremental-search-backward

if [[ "$(uname -s)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"

  fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
  [ -r $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd="zd"
  zd() {
    if [ $# -eq 0 ]; then
      builtin cd ~ && return
    elif [ -d "$1" ]; then
      builtin cd "$1"
    else
      z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
  }
fi

if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

[ -r ~/.sh.d/aliases ] && source ~/.sh.d/aliases
[ -r ~/.sh.d/secrets ] && source ~/.sh.d/secrets
[ -r ~/.sh.d/envs ] && source ~/.sh.d/envs

function ghpr() {
  GH_FORCE_TTY=100% gh pr list |
    fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 |
    awk '{print $1}' |
    xargs gh pr checkout
}
