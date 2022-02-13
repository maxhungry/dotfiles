export ZSH=$HOME/.oh-my-zsh

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

export N_PREFIX=$HOME/n
export PATH=$N_PREFIX/bin:$PATH

export KEYTIMEOUT=1
export CLICOLOR=1
export VISUAL=nvim
export EDITOR=$VISUAL
export MANPAGER='nvim +Man!'

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
