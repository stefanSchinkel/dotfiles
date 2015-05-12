#!/bin/sh

ln -fsv ~/dotfiles/bashrc ~/.bashrc
ln -fsv ~/dotfiles/coloursrc ~/.coloursrc
ln -fsv ~/dotfiles/vimrc ~/.vimrc
ln -fsv ~/dotfiles/tmux.conf ~/.tmux.conf

ln -fsv ~/dotfiles/bookmarks.xml ~/.local/share/radiotray/bookmarks.xml
ln -fsv ~/dotfiles/jshintrc .jshintrc
ln -fsv ~/dotfiles/jslintrc .jslintrc

ln -fsv ~/dotfiles/sublime/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymapln -s


cp -uv ~/dotfiles/bin/getGitBranch ~/bin/getGitBranch
cp -uvR ~/dotfiles/bin/fortune ~/bin/
