################################################################################
# My stuff
################################################################################

#################################################################################
# OS independent aliases
#################################################################################
alias c='clear'
alias tree='tree -C'
alias addmod="git status | grep 'modified' | awk "\''{print $3}'\'" | xargs git add"
alias cbranch="git branch | grep -v '*' | grep -v 'master' | xargs git branch -d"
alias ipython="ipython --colors Linux"

#################################################################################
# OS specific aliases
#################################################################################
# If using ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias tagrepo='cd .git; ctags -R ..; cd ..;'
    alias ack='ack-grep'
    alias ls='ls --color'

# If using mac
elif [[ "$OSTYPE" == "darwin11" ]]; then
    # Make mac use right ctags
    alias ctags="`brew --prefix`/bin/ctags"
    alias tagrepo='cd .git; ctags -R ..; cd ..;'
fi


# Colored term & prompt
export TERM=xterm-256color
export PS1="\[\033[01;36m\]\u@\[\033[00m\]\[\033[01;34m\]\h:\[\033[00m\]\W\[\033[01;31m\]\$(parse_git_branch)\[\033[00m\] $ "

# Bash vim keybindings
set -o vi

source ~/.git-completion.bash
# call git branch and pipe it through sed
# sed deletes every line not starting with *
# then take lines that start with * and grab the first word
# wrap commas around it and return
parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
