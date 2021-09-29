##
## PROJECT:  Directory Bookmarker and Runtime Amendments Bash script
## PARENT SCRIPT:  dot-bashrc-amendments.sh
## THIS SCRIPT:  z--dbm--alias-standard-commands.sh
##

function set_aliases()
{
##----------------------------------------------------------------------
##  PURPOSE:  set some useful aliases on standard Unix and Linux
##            commands.
##----------------------------------------------------------------------

    if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then  ## <-- integer comparison here
        echo "setting some shell safety and shortcut aliases . . ."
    fi

## Some important shell safe-guarding aliases for Unix and Linux systems:
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'

# list files in long format starting from a cleared screen:
    alias lss='clear; ls -lF'

# list directories only in long format:
    alias dls='ls -l | grep "^d"'

# run custom Remote UPtime script:
#    alias rup='${HOME}/bin/rup'

# Some type of csv maintenance command, 2021-09-28 need to test to understand purpose:
#    alias cvs='cvs -d ${HOME}/cvs -e /usr/bin/vi'

# Shell shortcuts to cd to local oft used directories:
#    alias archive='cd ${HOME}/archive; echo "Now at `pwd`" '
#    alias bin='cd ${HOME}/bin; echo "Now at `pwd`" '
#    alias notes='cd ${HOME}/notes; echo "Now at `pwd`" '

# 2012-01-25
    alias xterm='xterm -bg black -fg white -geometry 108x36'
    alias x='xterm -bg black -fg white -geometry 115x36 &'

# NOTE 2017-12-02 - xlock command generally not available on last
#  three years' Debian and Ubuntu software package mirrors.  Related
#  command 'xscreensaver-command -lock' is installable . . .
#    alias xlock='/usr/bin/xlock -mode scooter -count 100'

    alias df='df -h | grep sd; echo "( note \"df\" command aliased to \"df -h | grep sd\" )"'

} # end function set_aliases()


