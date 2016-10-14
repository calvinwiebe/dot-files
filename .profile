# This will disable non-repeating a key on hold down
# defaults write com.sublimetext.2 ApplePressAndHoldEnabled -bool false

echo '.profile'

# Add in the boxen paths (NOT)
#source /opt/boxen/env.sh

# Add this to the beginning of the path to use brew's stuff
# Do it here as ~/.profile gets run first for ~/.profile
export PATH=/usr/local/bin:$PATH

# Create some environment variables
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export CXXFLAGS=$CFLAGS
export PATH=$PATH:/Users/calvinwiebe/node_modules/.bin
export PATH=$PATH:/Users/calvinwiebe/utils
export CHROME_DRIVER=/Users/calvinwiebe/utils/chromedriver
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig
launchctl setenv PATH $PATH:/Users/calvinwiebe/node_modules/.bin

# Fix npm 'too many files open' error
ulimit -n 1000

# setup some alias
alias t="git log --oneline --graph --decorate --all --color=auto"
alias tc="git log --oneline --graph --decorate --color=auto"
alias n="git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | head -10"
alias c="clear"
alias p4merge="/Applications/p4merge.app/Contents/MacOS/p4merge"
alias g="grunt"
alias d="make debug"
alias s="git status"
alias gall="git add . && git commit"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Show branch on shell prompt
source /Users/calvinwiebe/utils/git-prompt.sh
export PS1='JIGGERO \w$(__git_ps1 "(%s)")=> '
[[ -s /Users/calvinwiebe/.nvm/nvm.sh ]] && . /Users/calvinwiebe/.nvm/nvm.sh # This loads NVM

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Rbenv/Users/calvinwiebe/.profile
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Docker/Cassandra
export PATH=$PATH:~/utils
export DOCKER_HOST=tcp://127.0.0.1:4243

### Cassandra binary
export PATH=$PATH:~/utils/cassandra-2.0.5/bin

### For Cassandra Cluster Manager (ccm)
# MOVE THESE TO OWN SCRIPT
#sudo ifconfig lo0 alias 127.0.0.2 up
#sudo ifconfig lo0 alias 127.0.0.3 up


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/calvinwiebe/.gvm/bin/gvm-init.sh" ]] && source "/Users/calvinwiebe/.gvm/bin/gvm-init.sh"
