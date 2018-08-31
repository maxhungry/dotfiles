export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
HIST_STAMPS="dd/mm/yyyy"
ZSH_CUSTOM=$HOME/.omz-custom

plugins=(git bundler z tmux)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib"
export KEYTIMEOUT=1
export CLICOLOR=1
export VISUAL=vim
export EDITOR=$VISUAL
export TERM=screen-256color
export MANPAGER="nvim -c 'set ft=man' -"
export PATH="$HOME/.fastlane/bin:$PATH"

# react-native
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
# export PATH=$PATH:/Users/maxhung/Library/Android/sdk/platform-tools

export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

export GPG_TTY=$(tty)

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

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/maxhung/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
