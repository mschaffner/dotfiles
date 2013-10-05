dotfiles
========
setup:<br>
git clone git@github.com:mschaffner/dotfiles.git<br>
git submodule init<br>
git submodule update<br>

A note on git and config files
==============================
If you need to ignore local changes to tracked files (we have that with local
modifications to config files), use:
git update-index --assume-unchanged [<file>...]
