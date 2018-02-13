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
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$HOME/.fastlane/bin:$PATH"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
# export PATH=$PATH:/Users/maxhung/Library/Android/sdk/platform-tools

# react-native
export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

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

# rbenv
eval "$(rbenv init -)"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

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
SPACESHIP_NODE_DEFAULT_VERSION="5"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
