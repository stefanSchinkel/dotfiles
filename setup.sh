#!/bin/sh

ln -fsv ~/dotfiles/bashrc ~/.bashrc
ln -fsv ~/dotfiles/coloursrc ~/.coloursrc
ln -fsv ~/dotfiles/bookmarks.xml ~/.local/share/radiotray/bookmarks.xml
ln -fsv ~/dotfiles/jshintrc .jshintrc
ln -fsv ~/dotfiles/jslintrc .jslintrc

cp -uv ~/dotfiles/bin/getGitBranch ~/bin/getGitBranch
cp -uvR ~/dotfiles/bin/fortune ~/bin/
