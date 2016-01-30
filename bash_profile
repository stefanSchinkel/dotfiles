# .bash_profile for OS X

set meta-flag on
set convert-meta off
set output-meta on

# use yellow for directories
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

export PATH="~/bin/:/bin:/sbin:/usr/bin:/usr/local/bin:/usr/sbin:/Applications/:/usr/texbin/:/usr/local/git/bin:/usr/local/mysql/bin"

## allow x11 apps to be run from OS X terminal
[[ -z $DISPLAY ]] && export DISPLAY=":0.0"

alias l="ll"
alias ls="ls -h -color"
alias ll="ls -lh -color"
alias la="ls -lah -color"
alias ..="cd .."
alias quit="exit"

# label title of Terminal to tell servers apart
export TITLEBAR='\[\033]0;\u@\h:\w \007\]'
# # Terminal sets TERM_PROGRAM so we can tell it apart from regular VT100
# case "$TERM_PROGRAM" in
# "Apple_Terminal")PS1="$TITLEBAR$PS1"
# 	esac
# case "$TERM" in
# 	"xterm")PS1="$TITLEBAR$PS1"
# esac

# red for root
if [ $(id -u) -eq 0 ];then
  PS1='\[\e[0;31m\]\u@\h:\w>\[\e[0m\]'
else # normal
  PS1='\[\e[1;33m\]`getGitBranch`\[\e[0m\]\n\u@\h:\w>'
fi

### raspBerry
alias cloudBerry="ssh dreeg@192.168.178.10"
alias bastelBerry="ssh pi@192.168.178.36"

alias clearRecent="defaults delete -g NSNavRecentPlaces;rm  ~/Library/Preferences/*LSSharedFileList.plist"

# for fixing iPhoto permissions
alias fixIphoto="sudo chmod -R +a \"diana allow read,write,append,delete,list,search,add_subdirectory,delete_child,file_inherit,directory_inherit\" /Users/Shared/iPhotoLibrary/;\
sudo chmod -R +a \"smokie allow read,write,append,delete,list,search,add_subdirectory,delete_child,file_inherit,directory_inherit\" /Users/Shared/iPhotoLibrary/"

## matlab
alias ml="/Applications/MATLAB_R2010b.app/bin/matlab -nodesktop -nosplash"
alias mlab="/Applications/MATLAB_R2010b.app/bin/matlab -nodesktop -nosplash"

## mysql
#alias startSQL="sudo /usr/local/mysql/support-files/mysql.server start"
#alias stopSQL="sudo /usr/local/mysql/support-files/mysql.server stop"

## the Python stuff
export PYTHONSTARTUP="/Users/smokie/.pythonrc"
alias ipython="ipython2-2.7 qtconsole"

# mplayer
alias mplayer="/Applications/MPlayer\ OSX\ Extended.app/Contents/Resources/Binaries/mpextended.mpBinaries/Contents/mpextended.mpBinaries/Contents/MacOS/mplayer"

# set GIT to front of path
export PATH="/usr/local/git/bin:$PATH"


##
# Your previous /Users/smokie/.bash_profile file was backed up as /Users/smokie/.bash_profile.macports-saved_2014-08-25_at_22:11:28
##

# MacPorts Installer addition on 2014-08-25_at_22:11:28: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

