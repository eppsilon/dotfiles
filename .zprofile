source ./.zprofile.prezto

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
ulimit -n 8192

# docker
export DOCKER_MACHINE_DRIVER=vmwarefusion

source $HOME/.zprofile.user
