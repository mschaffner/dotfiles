dotfiles
========
setup:<br>
git clone git@github.com:mschaffner/dotfiles.git<br>
git submodule init<br>
git submodule update<br>
use tmpl.gitconfig as base for .gitconfig file

Adding a submodule
==================
git submodule add (git link) (path)

Some notes on git
=================
If you need to ignore local changes to tracked files (we have that with local
modifications to config files), use:
git update-index --assume-unchanged [<file>...]

To exclude a file from local index add it to .git/info/exclude

connect the dots on a new machine
---------------------------------
```bash
cd ~/dev/
git clone http://github.com/mschaffner/dotfiles.git
ln -s ~/dev/dotfiles/.vim ~/.vim
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
ln -s ~/dev/dotfiles/.inputrc ~/.inputrc
ln -s ~/dev/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dev/dotfiles/.bash_aliases ~/.bash_aliases
git submodule init
git submodule update
