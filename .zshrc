# Created by newuser for 5.0.2

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=/usr/local/bin:$PATH

# Create some environment variables
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin
export CXXFLAGS=$CFLAGS
export PATH=$PATH:/Users/calvinwiebe/node_modules/.bin
export PATH=$PATH:/Users/calvinwiebe/utils
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig
launchctl setenv PATH $PATH:/Users/calvinwiebe/node_modules/.bin

# Fix npm 'too many files open' error
ulimit -n 1000

# setup some alias
alias t="git log --oneline --graph --decorate --all --color=auto"
alias tc="git log --oneline --graph --decorate --color=auto"
alias n="git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | head -10"
alias c="clear"
alias p4merge="/Applications/p4merge.app/Contents/MacOS/p4merge"
alias ip="ifconfig | grep \"inet 10.126\""

# Sublime Text 3
alias subl="/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl"

# alias g="grunt"
# alias d="make debug"
# alias s="git status"
# alias gall="git add . && git commit"

# NVM
[[ -s /Users/calvinwiebe/.nvm/nvm.sh ]] && . /Users/calvinwiebe/.nvm/nvm.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#### Rbenv/Users/calvinwiebe/.profile
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#### Some random executables here
export PATH=$PATH:~/utils

#### Docker/Cassandra
# export DOCKER_HOST=tcp://127.0.0.1:4243
#alias consulenv='eval "$(docker-machine env default)"'
alias cqlshd='docker exec -it cassandra cqlsh'
### Cassandra binary
#export PATH=$PATH:~/utils/cassandra-2.0.5/bin

export SHELL=/bin/zsh
# ANTIGEN
source $HOME/.antigen.zsh
antigen use oh-my-zsh
antigen theme agnoster
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export DEFAULT_USER=$(whoami)
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle gitfast
antigen apply

#### docker-machine
#eval "$(docker-machine env default)"

#### consul
#export CONSUL_HOST=$(docker-machine ip default)

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/calvinwiebe/.gvm/bin/gvm-init.sh" ]] && source "/Users/calvinwiebe/.gvm/bin/gvm-init.sh"
