# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true
###############################################################################
###                     FRIENDS FORTUNES
##############################################################################
# just for the fun of it
if [ -t 1 ]; then
# check iff we are on a tty, only then serve fortune
# cookie - needed to make scp work properly
    if [ -x /usr/bin/fortune ] ; then
        /usr/bin/fortune ~/bin/fortune/friends
    fi
fi

################################################################################
###		       ENVs
################################################################################
export GIT_EDITOR=vim
export PATH=$PATH:$HOME/bin
################################################################################
###		       ALIASES
################################################################################
# defaults
alias ..="cd .."
alias ll="ls -lh --color=auto"
alias ls="ls --color=auto"
alias la="ls -lha --color=auto"
alias quit="exit"

# to that tmux looks better w/ vim colorschemes
alias tmux="TERM=screen-256color-bce tmux"
alias cluster="ssh -Y schinkel@cluster"

# collect history
alias ref="history -a; history -c; history -r"

# matrix to the rescue
alias neo=' xterm +sb -maximized -e "COLUMNS=540 LINES=90   matrix"'

################################################################################
###			  PATH CUSTOMIZATION
################################################################################
# QGIS lib paths
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/apps/lib/
#TEX
export TEXINPUTS=$TEXINPUTS:~/texmf/:

################################################################################
###			  NODE CUSTOMIZATION
################################################################################
export NODE_PATH=/usr/lib/node_modules

################################################################################
###			  PYTHON CUSTOMIZATION
################################################################################
PYTHONSTARTUP=~/.pythonrc
export PYTHONSTARTUP

PYTHONPATH=$PYTHONPATH:~/lib/python2.7/site-packages/
export PYTHONPATH

# setup variable for QT designer to use matplotly
export  PYQTDESIGNERPATH=/usr/lib64/qt4/plugins/designer/python/matplotlibplugin.py


###############################################################################
###			  SHARED COMMAND HISTORY
###############################################################################

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND=$PROMPT_COMMAND
###############################################################################
###			  PROMPT CUSTOMIZATION
##############################################################################
# default PS1 is: export PS1=\[$(pwd)\]\u@\h:\w
# now we add the current git branch in PS in bold yellow
# yellow : '\[\e[1;33m\]'
# reset : ' \[\e[0\]'


# red for root
if [ $(id -u) -eq 0 ];then
  PS1='\[\e[0;31m\]\u@\h:\w>\[\e[0m\]'
else # normal
  PS1='\[\e[1;33m\]`getGitBranch`\[\e[0m\]\n\u@\h:\w>'
fi
export PS1
# fiddle with dircolor (dircolors -p >.colorsrc
eval `dircolors ~/.coloursrc`

# no annoying beeps
xset b 0

