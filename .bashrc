#Paths:
# bin path
export PATH="$PATH:/usr/local/Cellar/ruby/2.5.1/bin:/usr/bin:/usr/local/bin:/usr/local/sbin"
export PATH="/bin:/usr/sbin:/sbin:$PATH"
# git path
export PATH="/usr/local/bin/git:$PATH"
# Python Path
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# Android sdk path
export ANDROID_HOME=~/Library/Android/sdk
# Android emulator path
export PATH=${PATH}:${ANDROID_HOME}/emulator
# Android sdk-tools path
export PATH=~/Library/Android/sdk/tools:$PATH
# Android sdk platform tools path
export PATH=~/Library/Android/sdk/platform-tools:$PATH
# Android platform tools path
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
# Java Home path
export JAVA_HOME=$(/usr/libexec/java_home)
# Postgres path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost
# Elixir path
export PATH="$PATH:/path/to/elixir/bin"
# Leiningen Path
export PATH="$PATH:$HOME/.lein"
# Flutter path
export PATH=$HOME/flutter/bin:$PATH
# Go Path
export PATH=$PATH:/usr/local/Cellar/go/1.12.4/bin
#export PATH=$PATH:/Users/ninanjohn/go/bin
export GOPATH=$HOME/go

# Source fzf
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash



export PATH="$HOME/.cargo/bin:$PATH"
# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME=/Users/ninanjohn/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
# <<< talisman <<<
