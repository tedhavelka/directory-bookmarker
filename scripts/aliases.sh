# Function to show vi (vim) sessions
function vu()
{
    echo "2026-01-26 - running a sourced function from aliases.sh:"
    ps -x | grep ' vi'
}

function lstty()
{
    ls -lt /dev/ttyACM* /dev/ttyUSB*
}

function set_aliases()
{
##----------------------------------------------------------------------
##  PURPOSE: . . .
##----------------------------------------------------------------------

# COMMENT - aliases to add some safety to file modifying commands:
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'

# COMMENT - aliases for directory and file listing:
    alias lss='clear; ls -lF'

# list directories only in long format:
    alias dls='ls -l | grep "^d"'

# 2026-01-25 DOM - para mostrar carpetas escondidas:
    alias lsa='ls -a'

# COMMENT - other aliases . . .

# run custom Remote UPtime script:
    alias rup='${HOME}/bin/rup'
# . . .
    alias cvs='cvs -d ${HOME}/cvs -e /usr/bin/vi'

# 2012-01-25
    alias xterm='xterm -bg black -fg white -geometry 108x36'
    alias x='xterm -bg black -fg white -geometry 115x36 &'

# NOTE 2017-12-02 - xlock command generally not available on last
#  three years' Debian and Ubuntu software package mirrors.  Related
#  command 'xscreensaver-command -lock' is installable . . .

    alias xlock='/usr/bin/xlock -mode scooter -count 100'

# TODO [ ] Update following alias as primary bookmarker script has been
#          refactored and renamed . . .
#    alias restore-path-var='. ${HOME}/dot-bashrc-amendments.sh restore-path-variable'

# COMMENT - alias to show active vim sessions . . . this alias failing for use of ''' and '"' in
#            pattern matching arg passed to grep.
    # SEARCH_PATTERN_0125="'vi '"
    # alias vu='ps -u $USER | grep $SEARCH_PATTERN_0125'

    alias ftdis='ls -lt /dev/ttyUSB* /dev/ttyACM*'

# COMMENT - shortcut to go to directory bookmark scripts
    # TODO [ ] rename path for directory bookmark scripts and data files
    # alias dbms cd $HOME/.directory-bookmarks/scripts
    alias dbms='cd $HOME/.bookmarked-paths/scripts'

} # end function set_aliases()
