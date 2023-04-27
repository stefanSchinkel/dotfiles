#!/bin/sh

# configs
ln -fsv ~/.dotfiles/bashrc ~/.bashrc
ln -fsv ~/.dotfiles/tmux.conf ~/.tmux.conf

# screen layouts
# vim
ln -fsv ~/.dotfiles/vimrc ~/.vimrc
mkdir ~/.vim/
ln -fsv ~/.dotfiles/vim/colors/ ~/.vim/colors


# helper binaries
# for $HELPER in bin; do foo; done
ln -fsv ~/.dotfiles/bin/getGitBranch ~/bin/
ln -fsv ~/.dotfiles/bin/fortune ~/bin/
ln -fsv ~/.dotfiles/bin/matrix ~/bin/

