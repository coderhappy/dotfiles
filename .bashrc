#########
# Aliases
#########
# Lists
alias ls='ls --color'
alias lsa='ls -a --color'
alias lssa='ls -sa --color'
alias role='whoami -groups -fo list | grep -i'
alias ff='find . -type f -name'

# Repo Nav
alias home='cd ~'
alias work='cd ~/Home/work'
alias sandbox='cd ~/Home/sandbox'

# Visual Studio
alias ss='start src/*.sln'

# Work Specific
alias bake='bundle exec rake'
alias oe='cd ~/Home/work/one-exchange'

#########
# SSH
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
