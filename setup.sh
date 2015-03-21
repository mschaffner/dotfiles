#!/bin/bash

if [ ! -d "$HOME/dev" ]; then
    mkdir -p "$HOME/dev"
fi

cd ~/dev/
git clone git@github.com:mschaffner/dotfiles.git
cd dotfiles

ln -sfh ~/dev/dotfiles/.vim         ~/.vim
ln -s ~/dev/dotfiles/.vimrc         ~/.vimrc
ln -s ~/dev/dotfiles/.ctags         ~/.ctags
ln -s ~/dev/dotfiles/.inputrc       ~/.inputrc
ln -s ~/dev/dotfiles/.tmux.conf     ~/.tmux.conf
ln -s ~/dev/dotfiles/.bash_aliases  ~/.bash_aliases

git submodule init
git submodule update
