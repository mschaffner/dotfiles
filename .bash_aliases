################################################################################
# My stuff
################################################################################

#################################################################################
# OS independent aliases
#################################################################################
alias c='clear'
alias tree='tree -C'
alias addmod="git status | grep 'modified' | awk "\''{print $3}'\'" | xargs git add"
alias cbranch="git branch | grep -v '*' | grep -v 'master' | xargs git branch -d &> /dev/null; echo 'Done'"
alias ipython="ipython --colors Linux"
alias ggraph="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias grep="grep --color"

#################################################################################
# OS specific aliases
#################################################################################
# If using ubuntu
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias tagrepo='cd .git; ctags -R --exclude="*dist/*" ..; cd ..;'
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

################################################################################
# Functions
#################################################################################

function pullmaster {
    BRANCH=$(git branch | grep '*' | awk '{print $2}')
    STASH=$(git stash save tmpstuff)
    git checkout master
    git pull
    git checkout $BRANCH
    if [ "$STASH" != "No local changes to save" ]; then
        git stash apply stash^{/tmpstuff}
    fi
}
