#!/bin/bash

##############
## Platform ##
##############
platform='unknown'
if [ "$(uname)" == "Darwin" ]; then
    platform='mac_osx'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    platform='linux'
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    platform='win_nt'
fi

#############
## Aliases ##
#############

#### Lists ####
if [[ $platform == 'win_nt' ]]; then
   alias ls='ls --color=auto'
elif [[ $platform == 'mac_osx' ]]; then
   alias ls='ls -G'
fi
alias lsa='ls -a'
alias lssa='ls -sa'
alias role='whoami -groups -fo list | grep -i'
alias ff='find . -type f -name'

#### Directory Nav ####
alias home='cd ~'
alias work='cd ~/Home/work'
alias sandbox='cd ~/Home/sandbox'
alias oe='cd ~/Home/work/one-exchange'

#### Webpack ####
alias wp='webpack --colors --progress'
alias wpw='webpack --colors --progress --watch'

#### Git ####
alias gitk='gitk &'
alias gitka='gitk --all'

#### Visual Studio ####
alias ss='start src/*.sln'

#### Ruby/Bundler ####
alias bake='bundle exec rake'

#### Favorite Repos ####
alias oe='cd ~/Home/work/one-exchange'


#########
## SSH ##
#########

SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  # spawn ssh-agent
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo succeeded
  chmod 600 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add
}
        
if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
  start_agent;
}
else
  start_agent;
fi
