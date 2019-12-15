export PATH=~/scripts:$PATH


# Antigen Section
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell
#antigen theme borekb/agkozak-zsh-theme@prompt-customization

# Tell Antigen that you're done.
antigen apply

# End Antigen Section


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gbrl="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gnlo="git --no-pager log --oneline --decorate --color"
#alias glld="git lld"
alias glld=" git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --name-status"
alias gmf="git merge --ff-only"
alias gbd="git branch -d"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias glcsv="git log --date=short --pretty-format:'%h,%cn,%cd,%s' -- . ':!Website/*Print_Form_*' '!.git*' '!.keep'"

# load ssh agent (from https://help.github.com/en/articles/working-with-ssh-key-passphrases)
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }
agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env