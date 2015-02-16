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
if [ -t 1 ]; then  	# check iff we are on a tty, only then serve fortune 
					# cookie - needed to make scp work properly
        if [ -x /usr/bin/fortune ] ; then
                        /usr/bin/fortune ~/bin/fortune/friends
        fi
fi



################################################################################
###		       ALIASES
################################################################################
# defaults
alias ..="cd .."
alias ll="ls -lh --color=auto"
alias ls="ls --color=auto"
alias la="ls -lha --color=auto"
alias quit="exit"


# mounts and logins
#alias mountAIX="sshfs -o workaround=rename schinkel@aix: net/aix/"
alias mountSwipo="sshfs -o workaround=rename schinkel@aix:/data/swipo/  swipo/"
alias cluster="ssh -Y schinkel@cluster"

################################################################################
###			  PATH CUSTOMIZATION
################################################################################
# QGIS lib paths
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/schinkel/apps/lib/ 
#TEX 
export TEXINPUTS=$TEXINPUTS:/home/schinkel/texmf/:

################################################################################
###			  NODE CUSTOMIZATION
################################################################################
export NODE_PATH=/usr/lib/node_modules

################################################################################
###			  PYTHON CUSTOMIZATION
################################################################################
PYTHONSTARTUP=~/.pythonrc
export PYTHONSTARTUP

PYTHONPATH=$PYTHONPATH:/home/schinkel/lib/python2.7/site-packages/
PYTHONPATH=$PYTHONPATH:/home/schinkel/work/PIK/resnw/
export PYTHONPATH

# set the PYNGL_NCARG for PyNGL
export PYNGL_NCARG=/home/schinkel/lib/python2.7/site-packages/PyNGL/ncarg/

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
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

###############################################################################
###			  PROMPT CUSTOMIZATION
##############################################################################
# default PS1 is: export PS1=\[$(ppwd)\]\u@\h:\w
# now we add the current git branch in PS in bold yellow
export PS1='\[$(ppwd)\]\u@\h:\w`getGitBranch`>'

# fiddle with dircolor (dircolors -p >.colorsrc
eval `dircolors ~/.coloursrc`

# no annoying beeps
xset b 0

