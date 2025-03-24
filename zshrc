eval "$(/opt/homebrew/bin/brew shellenv)"

ZSH_THEME="spaceship"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_GRADLE_SHOW=false

plugins=(git bundler z tmux git-flow git-hubflow kubectl docker)

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

unsetopt nomatch # Allow '[' and ']' for rake tasks
setopt NO_BEEP
autoload -U colors # Enable color output
colors

autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

source $ZSH/oh-my-zsh.sh

if [ -f $HOMEBREW_PREFIX/share/zsh/site-functions/aws_zsh_completer.sh ]
then . $HOMEBREW_PREFIX/share/zsh/site-functions/aws_zsh_completer.sh
fi


bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^R" history-incremental-search-backward

# eval "$(rbenv init -)"

eval "$(mise activate zsh)"

source <(fzf --zsh)

[ -r ~/.sh.d/aliases ] && source ~/.sh.d/aliases
[ -r ~/.sh.d/secrets ] && source ~/.sh.d/secrets

if [[ `uname -s` = "Darwin" ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

function ghpr() {
  GH_FORCE_TTY=100% gh pr list |
    fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 |
    awk '{print $1}' |
    xargs gh pr checkout
}

. "$HOME/.cargo/env"
