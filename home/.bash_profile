. ~/.git-completion.bash
. ~/.cinderella.profile

PS1='[ \W $(__git_ps1 "%s") ] '
export EDITOR=/usr/bin/vim
export RSPEC=true
export CLICOLOR=1

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
# for ruby obdc
#export RUBYLIB="/usr/local/lib:$RUBYLIB"

export PATH="/usr/local/bin:$PATH"
alias ctags='/usr/local/bin/ctags'

alias test='AUTOSPEC=true autotest .'
alias feature='AUTOFEATURE=true autotest . -p wip'

alias sshpair='ssh pair@ryandotsmith.shacknet.nu'
alias rb='ssh pair@10.0.0.250'

# VIM keybindings
set -o vi
