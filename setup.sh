#!/bin/sh

# configs
ln -fsv ~/dotfiles/bashrc ~/.bashrc
ln -fsv ~/dotfiles/coloursrc ~/.coloursrc
ln -fsv ~/dotfiles/vimrc ~/.vimrc
ln -fsv ~/dotfiles/tmux.conf ~/.tmux.conf
ln -fsv ~/dotfiles/jshintrc ~/.jshintrc
ln -fsv ~/dotfiles/jslintrc ~/.jslintrc
ln -fsv ~/dotfiles/lxpanel ~/.config/lxpanel/default/panels/panel
# radios

ln -fsv ~/dotfiles/bookmarks.xml ~/.local/share/radiotray/bookmarks.xml

# sublime
ln -fsv ~/dotfiles/sublime/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
ln -fvs ~/dotfiles/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -sfv ~/dotfiles/sublime/latex.sublime-build ~/.config/sublime-text-3/Packages/User/latex.sublime-build
ln -fsv ~/dotfiles/sublime/Pylinter.sublime-settings ~/.config/sublime-text-3/Packages/Pylinter/Pylinter.sublime-settings

# german lang in sublime
mkdir -p ~/.config/sublime-text-3/Packages/User/German
cp -uvR  ~/dotfiles/sublime/Language-German/  ~/.config/sublime-text-3/Packages/User/

# binaries
cp -uv ~/dotfiles/bin/getGitBranch ~/bin/getGitBranch
cp -uvR ~/dotfiles/bin/fortune ~/bin/
cp -uv ~/dotfiles/bin/matrix ~/bin/matrix
cp -uv ~/dotfiles/bin/fullbackup.sh ~/bin/fullbackup.sh



# wMaker
ln -fsv ~/dotfiles/WMaker/autostart -> ~/GNUstep/Library/WindowMaker/autostart
ln -fsv ~/dotfiles/WMaker/WMWindowAttributes WMWindowAttributes

# ipython (qt console only, for now)
ln -fvs ~/dotfiles/ipython/ipython_qtconsole_config.py  ~/.ipython/profile_default/ipython_qtconsole_config.py

# need it?
#WMaker/Styles/* -> ~/GNUstep/Library/WindowMaker/Styles/
#WMaker/Themes/* -> ~/GNUstep/Library/WindowMaker/Themes

