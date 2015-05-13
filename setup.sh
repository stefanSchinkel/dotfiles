#!/bin/sh

# configs
ln -fsv ~/dotfiles/bashrc ~/.bashrc
ln -fsv ~/dotfiles/coloursrc ~/.coloursrc
ln -fsv ~/dotfiles/vimrc ~/.vimrc
ln -fsv ~/dotfiles/tmux.conf ~/.tmux.conf
ln -fsv ~/dotfiles/jshintrc .jshintrc
ln -fsv ~/dotfiles/jslintrc .jslintrc

# radios

ln -fsv ~/dotfiles/bookmarks.xml ~/.local/share/radiotray/bookmarks.xml

# sublime
ln -fsv ~/dotfiles/sublime/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymapln -s
ln -fvs ~/dotfiles/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# binaries
cp -uv ~/dotfiles/bin/getGitBranch ~/bin/getGitBranch
cp -uvR ~/dotfiles/bin/fortune ~/bin/

# wMaker
ln -fsv ~/dotfiles/WMaker/autostart -> ~/GNUstep/Library/WindowMaker/autostart 
# need it? 
#WMaker/Styles/* -> ~/GNUstep/Library/WindowMaker/Styles/
#WMaker/Themes/* -> ~/GNUstep/Library/WindowMaker/Themes

