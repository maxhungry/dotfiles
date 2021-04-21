ZSH_THEME="spaceship"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

plugins=(git bundler z tmux git-flow git-hubflow kubectl)

source $ZSH/oh-my-zsh.sh

unsetopt nomatch # Allow '[' and ']' for rake tasks
setopt NO_BEEP
autoload -U colors # Enable color output
colors

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^R" history-incremental-search-backward
bindkey -v

# rbenv
eval "$(rbenv init -)"

# fasd
eval "$(fasd --init auto)"

# avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

[ -r ~/.sh.d/aliases ] && source ~/.sh.d/aliases
[ -r ~/.sh.d/secrets ] && source ~/.sh.d/secrets
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Spaceship configs
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_RUBY_SYMBOL="●"
SPACESHIP_NODE_SYMBOL="⬢"

if [[ `uname -s` = "Darwin" ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/maxhung/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/maxhung/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/maxhung/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/maxhung/google-cloud-sdk/completion.zsh.inc'; fi

if [[ `uname -s` = "Linux" ]]; then
  export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
