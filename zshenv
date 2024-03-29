export ZSH=$HOME/.oh-my-zsh

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$HOME/.npm-global/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"

export PATH="/Users/max.hung/.local/bin:$PATH"
export PATH="$PATH:$HOMEBREW_PREFIX/anaconda3/bin"

export KEYTIMEOUT=1
export CLICOLOR=1
export VISUAL=nvim
export EDITOR=$VISUAL
export MANPAGER='nvim +Man!'
export BAT_THEME='gruvbox-light'

case `uname -s` in
  Darwin)
    export TERM=screen-256color
    ;;
  Linux)
    export TERM=xterm-256color
    export JAVA_HOME="/usr/local/android-studio/jre"
    ;;
esac

export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

export GPG_TTY=$(tty)

export HOMEBREW_NO_AUTO_UPDATE=1
