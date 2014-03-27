#!/bin/bash

cd ~/dev/
ln -s ~/dev/dotfiles/.vim           ~/.vim
ln -s ~/dev/dotfiles/.vimrc         ~/.vimrc
ln -s ~/dev/dotfiles/.inputrc       ~/.inputrc
ln -s ~/dev/dotfiles/.tmux.conf     ~/.tmux.conf
ln -s ~/dev/dotfiles/.bash_aliases  ~/.bash_aliases
git submodule init
git submodule update
