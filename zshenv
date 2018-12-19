export ZSH=$HOME/.oh-my-zsh

# export PATH="$HOME/.fastlane/bin:$PATH"
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/lib"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export KEYTIMEOUT=1
export CLICOLOR=1
export VISUAL=nvim
export EDITOR=$VISUAL
export TERM=xterm-256color
export MANPAGER="nvim -c 'set ft=man' -"

# react-native
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
# export PATH=$PATH:/Users/maxhung/Library/Android/sdk/platform-tools

export ANDROID_SDK=$HOME/android-sdk-macosx
export ANDROID_NDK=$HOME/android-ndk/android-ndk-r10e

export GPG_TTY=$(tty)