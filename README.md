dotfiles
========
setup:<br>
git clone git@github.com:mschaffner/dotfiles.git<br>
git submodule init<br>
git submodule update<br>

Adding a submodule
==================
git submodule add (git link) (path)

A note on git and config files
==============================
If you need to ignore local changes to tracked files (we have that with local
modifications to config files), use:
git update-index --assume-unchanged [<file>...]

connect the dots on a new machine
---------------------------------
```bash
cd ~
git clone http://github.com/mschaffner/dotfiles.git
ln -s ~/dev/dotfiles/.vim ~/.vim
ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
ln -s ~/dev/dotfiles/.tmux.conf ~/.tmux.conf
git submodule init
git submodule update
