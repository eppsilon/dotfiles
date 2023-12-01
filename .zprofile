# fix Chrome WebDriver issue
export LC_NUMERIC='en_US.UTF-8'

# homebrew
export PATH="/opt/homebrew/bin:$PATH"

# disable cd-ing to dir without cd command
export AUTO_CD=0

# browser
export BROWSER='open'

# editors
export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

# less
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# ulimit
ulimit -n 10240
ulimit -u 1024

# NVM
export NVM_DIR="$HOME/.nvm"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# go
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/tools:$PATH"

# node modules CLI
export PATH="$HOME/.node-cli/node_modules/.bin:$PATH"

# azure CLI
export PATH="$PATH:$HOME/.azure-cli/bin"

# .NET Core SDK tools
export PATH="$PATH:$HOME/.dotnet/tools"

# Azure AKS tools
export PATH="$PATH:/opt/azure-aks/bin"

# homebrew
export HOMEBREW_NO_ENV_HINTS=1

# JetBrains
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# local
source $HOME/.zprofile.user
