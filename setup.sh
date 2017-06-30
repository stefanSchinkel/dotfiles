#!/bin/sh

# configs
ln -fsv ~/.dotfiles/bashrc ~/.bashrc
ln -fsv ~/.dotfiles/coloursrc ~/.coloursrc
ln -fsv ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -fsv ~/.dotfiles/lxpanel ~/.config/lxpanel/default/panels/panel
ln -fsv ~/.dotfiles/conkyrc ~/.conkyrc
ln -fsv ~/.dotfiles/Xresources ~/.Xresources

# screen layouts
ln -fsv ~/.dotfiles/screenlayout/ ~/.screenlayout
# vim
ln -fsv ~/.dotfiles/vimrc ~/.vimrc
mkdir ~/.vim/
ln -fsv ~/.dotfiles/vim/colors/ ~/.vim/colors

# mounts an shares
ln -fsv ~/.dotfiles/bin/mountSamba ~/bin/mountSamba

# python and ipython (qtconsole)
ln -fsv ~/.dotfiles/pylintrc ~/.pylintrc
ln -fsv ~/.dotfiles/pythonrc ~/.pythonrc
ln -fsv ~/.dotfiles/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py
ln -fsv ~/.dotfiles/ipython/ipython_qtconsole_config.py  ~/.ipython/profile_default/ipython_qtconsole_config.py

# JS
ln -fsv ~/.dotfiles/jshintrc ~/.jshintrc
ln -fsv ~/.dotfiles/jslintrc ~/.jslintrc

# radios
ln -fsv ~/.dotfiles/radiotray/bookmarks.xml ~/.local/share/radiotray/bookmarks.xml

# sublime
ln -fsv ~/.dotfiles/sublime/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/Default\ \(Linux\).sublime-keymap
ln -fsv ~/.dotfiles/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -fsv ~/.dotfiles/sublime/latex.sublime-build ~/.config/sublime-text-3/Packages/User/latex.sublime-build
ln -fsv ~/.dotfiles/sublime/Pylinter.sublime-settings ~/.config/sublime-text-3/Packages/Pylinter/Pylinter.sublime-settings
ln -fsv ~/.dotfiles/sublime/pythonTest.sublime-build ~/.config/sublime-text-3/Packages/User/pythonTest.sublime-build
ln -fsv ~/.dotfiles/sublime/Python.sublime-build ~/.config/sublime-text-3/Packages/User/Python.sublime-build
ln -fsv ~/.dotfiles/sublime/PythonConsoleLight.hidden-tmTheme ~/.config/sublime-text-3/Packages/Anaconda/
ln -fsv ~/.dotfiles/sublime/Anaconda.sublime-settings ~/.config/sublime-text-3/Packages/User/Anaconda.sublime-settings

# german lang in sublime
mkdir -p ~/.config/sublime-text-3/Packages/User/German
cp -uvR  ~/.dotfiles/sublime/Language-German/  ~/.config/sublime-text-3/Packages/User/

# helper binaries
# for $HELPER in bin; do foo; done
ln -fsv ~/.dotfiles/bin/getGitBranch ~/bin/
ln -fsv ~/.dotfiles/bin/fortune ~/bin/
ln -fsv ~/.dotfiles/bin/matrix ~/bin/
ln -fsv ~/.dotfiles/bin/fullbackup.sh ~/bin/
ln -fsv ~/.dotfiles/bin/rdiffBackup.sh ~/bin/
ln -fsv ~/.dotfiles/bin/mountSamba ~/bin/
ln -fsv ~/.dotfiles/bin/mountBackup ~/bin/

# wMaker
ln -fsv ~/.dotfiles/WMaker/autostart  ~/GNUstep/Library/WindowMaker/autostart
ln -fsv ~/.dotfiles/WMaker/WMWindowAttributes ~/GNUstep/Defaults/WMWindowAttributes
ln -fsv ~/.dotfiles/WMaker/Styles/Haiku.style ~/GNUstep/Library/WindowMaker/Styles/Haiku.style
#WMaker/Styles/* -> ~/GNUstep/Library/WindowMaker/Styles/
#WMaker/Themes/* -> ~/GNUstep/Library/WindowMaker/Themes

# keymap for swapping left alt & ctrl
ln -fsv ~/.dotfiles/Xmodmap ~/.Xmodmap

# desktop files
ln -fsv ~/.dotfiles/ipython.desktop ~/.local/share/applications/ipython.desktop
