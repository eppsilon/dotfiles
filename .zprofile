source $HOME/.dotfiles/.zprofile.prezto

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

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ulimit
ulimit -n 10240
ulimit -u 1024

# docker
export DOCKER_MACHINE_DRIVER=vmwarefusion

# github API for brew
export HOMEBREW_GITHUB_API_TOKEN=ceaf7b2cee1317a8325228f9de31c3efb200f59b

# virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/repos
source /usr/local/bin/virtualenvwrapper.sh

# let me append to a nonexistent file, dammit
setopt clobber

# local
source $HOME/.zprofile.user
