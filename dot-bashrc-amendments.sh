#!/bin/bash

##----------------------------------------------------------------------
##
##
##  FILE:  .bashrc-amendments, also named dot-bashrc-amendments.sh
##
##
##  LAST TOUCHED:  2017-12-14 THU
##
##
##  DESCRIPTION:  short script to amend Debian and Ubuntu and or
##    Bourne shell run-time config file, normally named '.bashrc'.
##    Adds directory book-marking for up to thirty directories -- or
##    file system paths -- making these accessible by means of
##    three- and four- character aliases of the form 'gdnn' where
##    nn is an integer in the range 1 to 30.
##
##
##  HOW TO USE THIS SCRIPT:
##
##    To enjoy directory bookmark aliases in this file, in a bash
##    command line environment, the user may source this file by
##    hand,
##
##    $ . dot-bashrc-amendments.sh
##
##    or alternately for convenience a given user may amend their
##    .login or .bashrc start-up script to include a line which
##    does the same sourcing of this file.
##
##
##

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

##
##  NOTES ON IMPLEMENTATION:
##
##   (1) When this script is called with no arguments, it reads a run-
##     time config file to determine which group of file-stored,
##     bookmarked paths to read into shell variables and to make readily
##     accessible via path navigation aliases.  If the run-time config
##     is not found the shell creates it and populates it with its
##     identifier '1' for the first group among 1..9 supported groups
##     of path (also referred to as directory) bookmarks.
##
##   (2) When this script is called with a first argument in the range
##     1..9, a single character number representation, the script
##     writes this number to its run-time config file, and uses this
##     number to choose among groups of saved paths written to the
##     given user's dot-bashrc-amendments stored path files.  If not
##     called with a valid bookmarks group id, this script falls back
##     to doing the tasks in (1)
##
##
##
##
##  TO DO:
##
##    [ ]  add to this script function which detects and shows
##         the script's own aliases, and another function(s) to
##         allow user to change aliases, e.g. in event that alias
##         conflicts with a locally installed command,
##
##    [ ]  add to this script the ability to open arbitrary text
##         file containing bookmarked paths, and to show it without
##         replacing present bookmarks,
##
##    [ ]  add to this script a function to show bookmarks it
##         holds and status of whether each given bookmark exists
##         as a valid path on the local file system,
##
##    [ ]  2017-12-02 - add parameters sanity check to routine 'read_bookmarks_file',
##
##    [ ]  2017-12-02 - add settings file to store latest selected group of bookmarks,
##
##
##
##
##
##  TO CONFIRM:
##
##    [ ]  2017-12-02 - make sure that variable 'index' is visible in 
##         the scope of the script which sets the alias 'sp' which
##         saves bookmarked paths,
##
##
##
##  REFERENCES:
##
##    See 'The Linux Documentation Project' at http://tldp.org/
##
##    *  http://tldp.org/LDP/abs/html/testconstructs.html . . . [, [[ ]], (( )) - builtin test,
##         extended test, arithmetic test in bash context
##
##    *  http://tldp.org/LDP/abs/html/testbranch.html     . . . note shell 'shift' parameters operator
##
##    *  http://tldp.org/LDP/abs/html/complexfunct.html   . . . $1 $2 are first parameters to shell functions
##
##    *  http://www.grymoire.com/Unix/Sed.html
##
##    *  https://www.cyberciti.biz/faq/unix-howto-read-line-by-line-from-file/
##
##    *  http://www.linuxjournal.com/content/return-values-bash-functions
##
##
##
##  AUTHORS AND MAINTAINERS:
##
##    Ted Havelka, ted@cs.pdx.edu
##
##
##
##----------------------------------------------------------------------



##----------------------------------------------------------------------
##  SECTION - script variables of directory-bookmarker project
##----------------------------------------------------------------------

# --- SCRIPT VARS BEGIN ---

GREP=/bin/grep
SED=/bin/sed


SCRIPT_NAME=${0}
# echo "\$SCRIPT_NAME assigned value of \${0} and holds ${SCRIPT_NAME},"
SCRIPT_NAME="dot-bash-amendments.sh"

## 2018-07-13 - Directory BookMarking script
SCRIPT_NAME_ABBR="DBM"

DIRECTORY_OF_BOOKMARKS_FILES=".bookmarked-paths"

FILENAME_FORM_OF_BOOKMARKED_PATHS="bookmarked-paths-nn.txt"

FILENAME_OF_BOOKMARKS_RUNTIME_CONFIGURATION="bookmarked-paths.rc"

BOOKMARKS_GROUPS_SUPPORTED="1..9"

# Directory book marker watermark, for sane $PATH amendments:
DBM_WATERMARK="${HOME}/path-amended-by-directory-bookmarker"

# Assign a default bookmarks group file identifier to script scoped variable:
bookmarks_group_id=1

# Shell variable used in 'sp' alias to save bookmarked paths:
index=0


## 2017-12-02 - How are these variables used? - TMH
bash_settings_file="${HOME}/.bash_settings_local"


##----------------------------------------------------------------------
## Shell environment settings beyond directory bookmarking,
##  ( Set these variables to '1' to enable given environment
##    amendments. )
##----------------------------------------------------------------------

DBM_ENABLE_STANDARD_COMMAND_ALIASES=1
DBM_ENABLE_CUSTOM_ENVIRONMENT_VARIABLE_SETTING=1
DBM_ENABLE_SSH_AGENT_SUPPORT_FOR_GITBASH=0
DBM_AMEND_LOCAL_PROMPT_SCRIPT=1
DBM_LOOK_FOR_HELPER_SCRIPTS_IN_DEFAULT_AND_DEV_LOCATION=1


##----------------------------------------------------------------------
## Information, error and warning messages:
##----------------------------------------------------------------------

DBM_MESSAGES_QUIET=0
DBM_MESSAGES_ERRORS=1
DBM_MESSAGES_ERRORS_WARNINGS=2
DBM_MESSAGES_ERRORS_WARNINGS_INFO=3
DBM_MESSAGES_ERRORS_WARNINGS_INFO_VERBOSE=4

DBM_MESSAGING_LEVEL=$DBM_MESSAGES_QUIET

# --- SECTION SCRIPT VARIABLES END ---




##----------------------------------------------------------------------
##  SECTION - script functions
##----------------------------------------------------------------------

function show_aliases_in_this_script()
{
## 2017-12-02 NEED - Contributor Ted noting that following command will
##  show all script lines, including comments and commented out
##  commands (which are also comments), which this function's name
##  does not indicate.  NEED to fix this or rename this function . . .

    $(GREP) -n alias $0
}



function set_aliases_for_bookmarking()
{

#    echo "setting aliases for bookmarking of paths . . ."

    alias cb='echo "active directory bookmarks group presently set to group ${bookmarks_group_id},"'

#---------------------------------------------------------------------
# STEP:  create aliases for saving paths and returning to paths
#---------------------------------------------------------------------

# setting of bookmarks 1 through 10:

    alias sd1='export D1=`pwd`; echo "Set variable D1 to `pwd`" '
    alias sd2='export D2=`pwd`; echo "Set variable D2 to `pwd`" '
    alias sd3='export D3=`pwd`; echo "Set variable D3 to `pwd`" '
    alias sd4='export D4=`pwd`; echo "Set variable D4 to `pwd`" '
    alias sd5='export D5=`pwd`; echo "Set variable D5 to `pwd`" '

    alias sd6='export D6=`pwd`; echo "Set variable D6 to `pwd`" '
    alias sd7='export D7=`pwd`; echo "Set variable D7 to `pwd`" '
    alias sd8='export D8=`pwd`; echo "Set variable D8 to `pwd`" '
    alias sd9='export D9=`pwd`; echo "Set variable D9 to `pwd`" '
    alias sd10='export D10=`pwd`; echo "Set variable D10 to `pwd`" '

# setting of bookmarks 11 through 20:

    alias sd11='export D11=`pwd`; echo "Set variable D11 to `pwd`" '
    alias sd12='export D12=`pwd`; echo "Set variable D12 to `pwd`" '
    alias sd13='export D13=`pwd`; echo "Set variable D13 to `pwd`" '
    alias sd14='export D14=`pwd`; echo "Set variable D14 to `pwd`" '
    alias sd15='export D15=`pwd`; echo "Set variable D15 to `pwd`" '

    alias sd16='export D16=`pwd`; echo "Set variable D16 to `pwd`" '
    alias sd17='export D17=`pwd`; echo "Set variable D17 to `pwd`" '
    alias sd18='export D18=`pwd`; echo "Set variable D18 to `pwd`" '
    alias sd19='export D19=`pwd`; echo "Set variable D19 to `pwd`" '
    alias sd20='export D20=`pwd`; echo "Set variable D20 to `pwd`" '

# setting of bookmarks 21 through 30:

    alias sd21='export D21=`pwd`; echo "Set variable D21 to `pwd`" '
    alias sd22='export D22=`pwd`; echo "Set variable D22 to `pwd`" '
    alias sd23='export D23=`pwd`; echo "Set variable D23 to `pwd`" '
    alias sd24='export D24=`pwd`; echo "Set variable D24 to `pwd`" '
    alias sd25='export D25=`pwd`; echo "Set variable D25 to `pwd`" '

    alias sd26='export D26=`pwd`; echo "Set variable D26 to `pwd`" '
    alias sd27='export D27=`pwd`; echo "Set variable D27 to `pwd`" '
    alias sd28='export D28=`pwd`; echo "Set variable D28 to `pwd`" '
    alias sd29='export D29=`pwd`; echo "Set variable D29 to `pwd`" '
    alias sd30='export D30=`pwd`; echo "Set variable D30 to `pwd`" '

#    echo "- TEST - setting alias SD31 . . ."
    alias sd31='echo "Doh, thirty one bookmarks not supported!"'


## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## 1024  cd foo; echo $?
## 1025  cd foo; echo $?; if (( $? && 1 )); then echo "dir not found!"; else echo "now at $PWD"; fi
## 1026  cd foo; if (( $? && 1 )); then echo "dir not found!"; else echo "now at $PWD"; fi
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

## 2018-07-13 - added by Ted for improved notices when selected dir not found:
alias announce_new_dir='if (( $? && 1 )); then echo "- ${SCRIPT_NAME_ABBR} - dir not found!"; else echo "now at $PWD"; fi'

# navigation to bookmarked directories 1 through 10:

#    alias gd1='cd $D1; echo "Now at $D1" '
    alias gd1='cd $D1; if (( $? && 1 )); then echo "- ${SCRIPT_NAME_ABBR} - dir not found!"; else echo "now at $PWD"; fi'
    alias gd2='cd $D2; announce_new_dir'
    alias gd3='cd $D3; announce_new_dir'
    alias gd4='cd $D4; announce_new_dir'
    alias gd5='cd $D5; announce_new_dir'

    alias gd6='cd $D6; announce_new_dir'
    alias gd7='cd $D7; announce_new_dir'
    alias gd8='cd $D8; announce_new_dir'
    alias gd9='cd $D9; announce_new_dir'
    alias gd10='cd $D10; announce_new_dir'

# navigation to bookmarked directories 11 through 20:

    alias gd11='cd $D11; announce_new_dir'
    alias gd12='cd $D12; announce_new_dir'
    alias gd13='cd $D13; announce_new_dir'
    alias gd14='cd $D14; announce_new_dir'
    alias gd15='cd $D15; announce_new_dir'

    alias gd16='cd $D16; announce_new_dir'
    alias gd17='cd $D17; announce_new_dir'
    alias gd18='cd $D18; announce_new_dir'
    alias gd19='cd $D19; announce_new_dir'
    alias gd20='cd $D20; announce_new_dir'

# navigation to bookmarked directories 21 through 30:

    alias gd21='cd $D21; announce_new_dir'
    alias gd22='cd $D22; announce_new_dir'
    alias gd23='cd $D23; announce_new_dir'
    alias gd24='cd $D24; announce_new_dir'
    alias gd25='cd $D25; announce_new_dir'

    alias gd26='cd $D26; announce_new_dir'
    alias gd27='cd $D27; if (( $? && 1 )); then echo "- ${SCRIPT_NAME_ABBR} - dir not found!"; else echo "now at $PWD"; fi'
    alias gd28='cd $D28; announce_new_dir'
    alias gd29='cd $D29; announce_new_dir'
    alias gd30='cd $D30; announce_new_dir'






## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  'show paths' alias
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

alias s='\
echo
echo "Bookmarked paths in bookmarks group ${bookmarks_group_id} are:"
echo
\
echo "variable D1 points to $D1";\
 echo variable D2 points to $D2; echo variable D3 points to $D3; echo variable D4 points to $D4; echo variable D5 points to $D5; echo variable D6 points to $D6; echo variable D7 points to $D7; echo variable D8 points to $D8; echo variable D9 points to $D9; echo variable D10 points to $D10;\
\
echo " - - - - -";\
\
echo variable D11 points to $D11; echo variable D12 points to $D12; echo variable D13 points to $D13; echo variable D14 points to $D14; echo variable D15 points to $D15; echo variable D16 points to $D16; echo variable D17 points to $D17; echo variable D18 points to $D18; echo variable D19 points to $D19; echo variable D20 points to $D20;\
\
echo " - - - - -";\
\
echo "variable D21 points to $D21";\
echo "variable D22 points to $D22";\
echo "variable D23 points to $D23";\
echo "variable D24 points to $D24";\
echo "variable D25 points to $D25";\
\
echo "variable D26 points to $D26";\
echo "variable D27 points to $D27";\
echo "variable D28 points to $D28";\
echo "variable D29 points to $D29";\
echo "variable D30 points to $D30";\
\
echo; \
echo "These paths from bookmarks group ${bookmarks_group_id}."
echo EDITOR is set to: $EDITOR;\
echo "see file dot-bashrc-amendments.sh, typically in home directory of present user,";\
echo "for implementation of directory bookmarks and D1..D30 variables - TMH";\
echo "this shell script written by Ted Havelka and licensed under GNU Public License, 2005 - 2017";\
\
echo'

##------------------------------------------------------------------------------





alias sp='bookmarked_path[0]="zztop"; 
   bookmarked_path[1]=$D1;    bookmarked_path[2]=$D2;    bookmarked_path[3]=$D3;    bookmarked_path[4]=$D4;    bookmarked_path[5]=$D5; 
   bookmarked_path[6]=$D6;    bookmarked_path[7]=$D7;    bookmarked_path[8]=$D8;    bookmarked_path[9]=$D9;   bookmarked_path[10]=$D10; 

  bookmarked_path[11]=$D11;  bookmarked_path[12]=$D12;  bookmarked_path[13]=$D13;  bookmarked_path[14]=$D14;  bookmarked_path[15]=$D15; 
  bookmarked_path[16]=$D16;  bookmarked_path[17]=$D17;  bookmarked_path[18]=$D18;  bookmarked_path[19]=$D19;  bookmarked_path[20]=$D20; 

  bookmarked_path[21]=$D21;  bookmarked_path[22]=$D22;  bookmarked_path[23]=$D23;  bookmarked_path[24]=$D24;  bookmarked_path[25]=$D25; 
  bookmarked_path[26]=$D26;  bookmarked_path[27]=$D27;  bookmarked_path[28]=$D28;  bookmarked_path[29]=$D29;  bookmarked_path[30]=$D30; 

## 2017-12-14 THU:
  echo "about to save bookmarked paths using old script code in alias," 
  echo "in this code \$filename holds '$filename'," 
  echo "to local file $filename saving bookmarked directories:";
  echo -n > $filename; 
  for index in 0  1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16 17 18 19 20  21 22 23 24 25 26 27 28 29 30; do
      echo "saving bookmarked path $index = ${bookmarked_path[$index]}"; 
      echo ${bookmarked_path[$index]} >> $filename; 
  done'



# alias clearpaths='\
# echo "Clearing bookmarked paths in present shell . . ." \
# echo "Note:  bookmarked paths in bookmarks group ${bookmarks_group_id} still stored in ${filename}" \
# export D1=""; export D2=""; export D3=""; export D4=""; export D5=""; \
# export D6=""; export D7=""; export D8=""; export D9=""; export D10=""; \
# \
# export D11=""; export D12=""; export D13=""; export D14=""; export D15=""; \
# export D16=""; export D17=""; export D18=""; export D19=""; export D20=""; \
# \
# export D21=""; export D22=""; export D23=""; export D24=""; export D25=""; \
# export D26=""; export D27=""; export D28=""; export D29=""; export D30="";'


## 2017-12-14 - unexpected new behavior observed when backslash characters
##  appear in alias defining statement above, removing those:

alias clearpaths='
echo "Clearing bookmarked paths in present shell . . ."
echo "Note:  bookmarked paths in bookmarks group ${bookmarks_group_id} still stored in ${filename}"
echo "use \`lp${bookmarks_group_id}\` to reload those bookmarked paths."
export D1=""; export D2=""; export D3=""; export D4=""; export D5=""; \
export D6=""; export D7=""; export D8=""; export D9=""; export D10=""; \
\
export D11=""; export D12=""; export D13=""; export D14=""; export D15=""; \
export D16=""; export D17=""; export D18=""; export D19=""; export D20=""; \
\
export D21=""; export D22=""; export D23=""; export D24=""; export D25=""; \
export D26=""; export D27=""; export D28=""; export D29=""; export D30="";'



# 2017-12-02 - NEED TO ADDRESS INTENT AND ACTION OF load-paths:
# This alias likely doesn't work as intended, to load one set
# of bookmarked paths over others . . .    - TMH

alias load-paths=' \
export D1=${bookmarked_path[1]}; \
export D2=${bookmarked_path[2]}; \
export D3=${bookmarked_path[3]}; \
export D4=${bookmarked_path[4]}; \
export D5=${bookmarked_path[5]}; \
export D6=${bookmarked_path[6]}; \
export D7=${bookmarked_path[7]}; \
export D8=${bookmarked_path[8]}; \
export D9=${bookmarked_path[9]}; \
export D10=${bookmarked_path[10]}; \
\
export D11=${bookmarked_path[11]}; \
export D12=${bookmarked_path[12]}; \
export D13=${bookmarked_path[13]}; \
export D14=${bookmarked_path[14]}; \
export D15=${bookmarked_path[15]}; \
export D16=${bookmarked_path[16]}; \
export D17=${bookmarked_path[17]}; \
export D18=${bookmarked_path[18]}; \
export D19=${bookmarked_path[19]}; \
export D20=${bookmarked_path[20]}; \
\
export D21=${bookmarked_path[21]}; \
export D22=${bookmarked_path[22]}; \
export D23=${bookmarked_path[23]}; \
export D24=${bookmarked_path[24]}; \
export D25=${bookmarked_path[25]}; \
export D26=${bookmarked_path[26]}; \
export D27=${bookmarked_path[27]}; \
export D28=${bookmarked_path[28]}; \
export D29=${bookmarked_path[29]}; \
export D30=${bookmarked_path[30]}; \
echo "Loaded user-saved paths:"; s'


# Aliases to load different groups of bookmarked paths:

    alias lp1='. ${HOME}/dot-bashrc-amendments.sh 1'
    alias lp2='. ${HOME}/dot-bashrc-amendments.sh 2'
    alias lp3='. ${HOME}/dot-bashrc-amendments.sh 3'
    alias lp4='. ${HOME}/dot-bashrc-amendments.sh 4'
    alias lp5='. ${HOME}/dot-bashrc-amendments.sh 5'

    alias lp6='. ${HOME}/dot-bashrc-amendments.sh 6'
    alias lp7='. ${HOME}/dot-bashrc-amendments.sh 7'
    alias lp8='. ${HOME}/dot-bashrc-amendments.sh 8'
    alias lp9='. ${HOME}/dot-bashrc-amendments.sh 9'
    alias lp10='. ${HOME}/dot-bashrc-amendments.sh 10'


# 2017-12-14 - Alias 'show non-empty bookmarks' added by Ted:

    alias sne='
echo
echo "Showing non-empty bookmarks in bookmarks group ${bookmarks_group_id}:"
echo
 bookmarked_path[1]=$D1;    bookmarked_path[2]=$D2;    bookmarked_path[3]=$D3;    bookmarked_path[4]=$D4;    bookmarked_path[5]=$D5; 
 bookmarked_path[6]=$D6;    bookmarked_path[7]=$D7;    bookmarked_path[8]=$D8;    bookmarked_path[9]=$D9;   bookmarked_path[10]=$D10; 

bookmarked_path[11]=$D11;  bookmarked_path[12]=$D12;  bookmarked_path[13]=$D13;  bookmarked_path[14]=$D14;  bookmarked_path[15]=$D15; 
bookmarked_path[16]=$D16;  bookmarked_path[17]=$D17;  bookmarked_path[18]=$D18;  bookmarked_path[19]=$D19;  bookmarked_path[20]=$D20; 

bookmarked_path[21]=$D21;  bookmarked_path[22]=$D22;  bookmarked_path[23]=$D23;  bookmarked_path[24]=$D24;  bookmarked_path[25]=$D25; 
bookmarked_path[26]=$D26;  bookmarked_path[27]=$D27;  bookmarked_path[28]=$D28;  bookmarked_path[29]=$D29;  bookmarked_path[30]=$D30; 

for index in 1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16 17 18 19 20  21 22 23 24 25 26 27 28 29 30; do

    if [ -z ${bookmarked_path[$index]} ]; then
        echo "bookmarked_path[$index] not set," >> /dev/null
    else
        echo "\$D${index} set to ${bookmarked_path[$index]},"
    fi
done
echo
echo "Note:  dot-bash-amendments script supports thirty (30) bookmarked paths per bookmarks group."
echo'

    alias restore-path-var='. ${HOME}/dot-bashrc-amendments.sh restore-path-variable'

} # end function set_aliases_for_bookmarking()




function read_bookmarks_runtime_config()
{

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## VARS BEGIN

    local rname="read_bookmarks_runtime_config"

    local line="DEFAULT_LINE_TO_BE_READ_FROM_FILE"

    local bookmarks_group_id=""

## VARS END
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    


#    echo "* * * SCRIPT FUNCTION ${rname}() IMPLEMENTATION UNDERWAY * * *"

    filename=${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}/${FILENAME_OF_BOOKMARKS_RUNTIME_CONFIGURATION}

    if [ -e ${filename} ]; then
        # read bookmarked paths runtime config file . . .
#        echo "${rname}:  reading directory bookmarks runtime configuration file ${filename},"
#        cat ${filename}

        read -r line < ${filename}
#        echo "line 1 holds:  ${line}"

    else
        touch ${filename}
        if [ -e ${filename} ]; then
            echo "1" >> ${filename}
        else
            echo "${SCRIPT_NAME}:  - WARNING - unable to open and unable to create runtime config file!"
            echo "${SCRIPT_NAME}:  - will start with bookmarks group set to 1,"
            echo "${SCRIPT_NAME}:  - presently bookmarks groups 1 through 9 supported."
        fi
    fi

    echo ${line}
## 2017-12-14 - Commented echo statement and variable for later time when
##  this script able to parse several settings from rc file:
#    echo ${bookmarks_group_id}

} # end function read_bookmarks_runtime_config()




function write_bookmarks_runtime_config()
{
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  2017-12-14 - Script contributor Ted noting that this function to
##   write the bookmarks run-time config file is nearly identical to
##   the function to read this same file.  Wondering if there's an
##   elegant way to combine the two functions?  - TMH
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    echo "* * * Script function write_bookmarks_runtime_config() implementation underway * * *"
    echo "called with bookmarks group identifier '${1}',"

    filename=${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}/${FILENAME_OF_BOOKMARKS_RUNTIME_CONFIGURATION}

    if [ -e ${filename} ]; then
        # write one value bookmarked paths runtime config file, overwriting all data in this file:
        echo "${SCRIPT_NAME}:  writing directory bookmarks runtime configuration file . . ."
        echo ${1} > ${filename}
    else
        touch ${filename}
        if [ -e ${filename} ]; then
            echo ${1} > ${filename}
        else
            echo "${SCRIPT_NAME}:  - WARNING - unable to open and unable to create runtime config file!"
            echo "${SCRIPT_NAME}:  - will start with bookmarks group set to 1,"
            echo "${SCRIPT_NAME}:  - presently bookmarks groups 1 through 9 supported."
        fi
    fi
}



function read_bookmarks_file()
{

#    echo "*** Routine 'read_bookmarks_file' development in progress, ***"
#    echo "first two arguments from caller are '$1' and '$2',"
#    echo "variable \${SED} holds '${SED}',"

    local bookmarked_paths_group=${2}

    REGEX="[1-9]"
    if [[ ${bookmarked_paths_group} =~ ${REGEX} ]] ; then
        if [ $DBM_MESSAGING_LEVEL -ge $DBM_MESSAGES_ERRORS_WARNINGS_INFO ]; then
            echo "caller requests valid bookmarks file identified by '${2}', which is in the range ${BOOKMARKS_GROUPS_SUPPORTED}"
        fi
    else
        if [ $DBM_MESSAGING_LEVEL -ge $DBM_MESSAGES_ERRORS_WARNINGS ]; then
            echo "- WARNING - caller requests unsupported or unknown bookmarks file identified by '${2}',"
        fi
        if [ $DBM_MESSAGING_LEVEL -ge $DBM_MESSAGES_ERRORS_WARNINGS_INFO ]; then
            echo "- INFO - defaulting to read bookmarked directories in bookmarks group 1,"
        fi
        bookmarked_paths_group=1
    fi

##    bookmarks_filename=$(echo ${FILENAME_FORM_OF_BOOKMARKED_PATHS} | ${SED} s/nn/0${2}/)
    bookmarks_filename=$(echo ${FILENAME_FORM_OF_BOOKMARKED_PATHS} | ${SED} s/nn/0${bookmarked_paths_group}/)

    echo "will read bookmarks from file named ${bookmarks_filename},"

## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
##  NOTE - had trouble getting these export statements to fly . . .
##
##   Ahh finally makes sense now 2017 DEC, these export statements
##   don't express explicit variable names.  That is, bash must see
##   a shell script declared array element as something other than a
##   valid variable name:                                         - TMH
## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

# export ${bookmarked_path[0]}
# export ${bookmarked_path[1]}
# export ${bookmarked_path[2]}
# export ${bookmarked_path[3]}
# export ${bookmarked_path[4]}
# export ${bookmarked_path[5]}



##----------------------------------------------------------------------
##  STEP:  retrieve saved paths from previous user session
##----------------------------------------------------------------------

# filename="${HOME}/.bash_paths_saved"
# filename="${HOME}/bookmarked-paths.txt"  . . . commmented 2017-12-02 SAT
filename=${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}/${bookmarks_filename}

## 2017-02-09 THU - To be added, support for storing and perusing multiple directory bookmarks files:
filename__list_of_bookmark_files="${HOME}/bookmarked-path-files.txt"



# REFERENCE:  http://tldp.org/LDP/abs/html/arrays.html

declare -a bookmarked_path=()



if [ -e ${filename} ]; then
    bookmarked_path=( $(cat "$filename") )  #  Stores contents of this script
                                     #+ ($bash_settings_local) in an array.
else
#    echo "$O:  no local bash settings file named ${bash_settings_file} found," > /dev/null
    echo "${SCRIPT_NAME}:  - WARNING - direcory bookmarks file named ${filename} not found!"
    echo "${SCRIPT_NAME}:  - not able to read in bookmarked directories from this file,"
    echo "${SCRIPT_NAME}:  - but creating to hold paths going forward . . ."
    touch ${filename}
    return
fi


    if [ ]; then
        echo ""
        echo "- DIAG START -"
        echo "after reading bookmarks file,"
        echo "\${bookmarked_path[1]} holds '${bookmarked_path[1]}'"
        echo "\${bookmarked_path[2]} holds '${bookmarked_path[2]}'"
        echo "\${bookmarked_path[3]} holds '${bookmarked_path[3]}'"
        echo "- DIAG END -"
        echo ""
    fi


# 2006-11-27
# Prior to storing user-saved paths in a local file, path
# variables were assigned zero-length strings and exported like this:
#
# export D1=""
#
# Now these variables are exported the same way but assigned
# differently . . .

# echo "reading saved paths from file, skipping first place-holder token '${bookmarked_path[0]}' . . ."

    export D1=${bookmarked_path[1]}
    export D2=${bookmarked_path[2]}
    export D3=${bookmarked_path[3]}
    export D4=${bookmarked_path[4]}
    export D5=${bookmarked_path[5]}

    export D6=${bookmarked_path[6]}
    export D7=${bookmarked_path[7]}
    export D8=${bookmarked_path[8]}
    export D9=${bookmarked_path[9]}
    export D10=${bookmarked_path[10]}

    export D11=${bookmarked_path[11]}
    export D12=${bookmarked_path[12]}
    export D13=${bookmarked_path[13]}
    export D14=${bookmarked_path[14]}
    export D15=${bookmarked_path[15]}

    export D16=${bookmarked_path[16]}
    export D17=${bookmarked_path[17]}
    export D18=${bookmarked_path[18]}
    export D19=${bookmarked_path[19]}
    export D20=${bookmarked_path[20]}

    export D21=${bookmarked_path[21]}
    export D22=${bookmarked_path[22]}
    export D23=${bookmarked_path[23]}
    export D24=${bookmarked_path[24]}
    export D25=${bookmarked_path[25]}

    export D26=${bookmarked_path[26]}
    export D27=${bookmarked_path[27]}
    export D28=${bookmarked_path[28]}
    export D29=${bookmarked_path[29]}
    export D30=${bookmarked_path[30]}


    if [ ]; then
        echo ""
        echo "- DIAG START -"
        echo "after exporting \$D1..\$D30,"
        echo "\$D1 holds '$D1',"
        echo "\$D2 holds '$D2',"
        echo "\$D3 holds '$D3',"
        echo "- DIAG END -"
        echo ""
    fi


} # end function read_bookmarks_file()




function clear_paths_function()
{

#    echo "clear_paths_function:  clearing bookmarked paths in current shell, setting \$D1..\$D30 to '',"

    export D1=""; export D2=""; export D3=""; export D4=""; export D5="";
    export D6=""; export D7=""; export D8=""; export D9=""; export D10="";

    export D11=""; export D12=""; export D13=""; export D14=""; export D15="";
    export D16=""; export D17=""; export D18=""; export D19=""; export D20="";

    export D21=""; export D22=""; export D23=""; export D24=""; export D25="";
    export D26=""; export D27=""; export D28=""; export D29=""; export D30="";

}




function amend_path_variable()
{
##----------------------------------------------------------------------
##  PURPOSE:  amend user's $PATH environment variable
##
##  NEED:  to add logic so that for a given shell session, when this
##   script called a second or successive time it does not amend the
##   $PATH variable with duplicate paths.  Need a test . . .   - TMH
##
##  KEYWORDS:  amend PATH amend path
##----------------------------------------------------------------------

    string=`echo $PATH | grep $DBM_WATERMARK`

    if [ -z "$string" ]
    then
        if [ -e ./.bookmarked-paths/local-path-amendments.sh ]; then
            echo "amending \${PATH} with local user paths outside of dot-bashrc script . . ."
            . ./.bookmarked-paths/local-path-amendments.sh
        fi

        path_as_found=${PATH}

# Amending the default path variable:

# 2021-07-25 . . .
        PATH="${PATH}":${HOME}/.local/bin
        PATH="${PATH}":/opt/zephyr-sdk-0.12.4
        PATH="${PATH}":/opt/zephyr-sdk-0.12.4/arm-zephyr-eabi
        PATH="${PATH}":/opt/zephyr-sdk-0.12.4/arm-zephyr-eabi/bin

#        PATH="/usr/bin:${PATH}"
        PATH="${PATH}":/sbin
        PATH="${PATH}":/usr/sbin
        PATH="${PATH}":/opt/bin
        PATH="${PATH}":/opt/cross/bin
        PATH="${PATH}":/opt/nxp/lpcxpresso-8p2p2/lpcxpresso/tools/bin
        PATH="${PATH}":/opt/nxp/lpcxpresso-8p2p2/lpcxpresso
#        PATH="${PATH}":/opt/cross/x-tools/arm-unknown-linux-gnueabi/bin
#        PATH="${PATH}":.
        PATH="${PATH}":${HOME}/bin
        PATH="${PATH}":/usr/local/mysql/bin
        PATH="${PATH}":/usr/lib/xscreensaver
        PATH="${PATH}":/etc/init.d

# 2014-01-24 . . .
        PATH="${PATH}":/var/opt/sam-ba_cdc_cdc_linux

# 2017-12-04 . . .
        PATH="${PATH}":~/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin

# 2021-01-31 . . .
        PATH="${PATH}":/opt/eagle-9.6.2

## 2018-01-19 - add a pattern to the path to avoid multple path variable
##  amendments per shell session:
        PATH="${PATH}:$DBM_WATERMARK"
    else
        echo "\$PATH variable already amended, directory book-marker leaving untouched."
    fi

}



function restore_path_variable_to_as_found()
{
    PATH=$path_as_found
}



function find_ssh_agent_pid()
{

# 2020-10-30 FRI - work to configure ssh-agent per gitbash session:

LOCAL_VAR_SSH_AGENT_RUNNING_PROCESS_COUNT=$(ps -u $USERNAME | grep agent | wc | awk '{print $1}')
LOCAL_VAR_SSH_AGENT_VARS_FILENAME="z--ssh-agent-env-vars.txt"

echo "Checking for ssh-agent daemon process:"

if [ $LOCAL_VAR_SSH_AGENT_RUNNING_PROCESS_COUNT -ne 0 ]; then
    echo "Found one or more ssh-agent processes running,"
    if [ -e $LOCAL_VAR_SSH_AGENT_VARS_FILENAME ]; then
        echo "Reading env variables relating to earliest started ssh-agent instance..."
        var1=$(cat $LOCAL_VAR_SSH_AGENT_VARS_FILENAME | sed -n '1p')
        var2=$(cat $LOCAL_VAR_SSH_AGENT_VARS_FILENAME | sed -n '2p')
        echo "exporting $var1 to SSH_AGENT_PID env var..."
        export SSH_AGENT_PID=$var1
        echo "exporting $var2 to SSH_AUTH_SOCK env var..."
        export SSH_AUTH_SOCK=$var2
    else
        echo "but no locally written environment vars found!"
    fi
else
    echo "none found, starting..."
    eval $(/usr/bin/ssh-agent -s)
    /usr/bin/ssh-add $HOME/.ssh/id-ed25519-key
    var3=$(set | grep SSH_AGENT_PID | cut -d'=' -f 2)
    var4=$(set | grep SSH_AUTH_SOCK | cut -d'=' -f 2)
    echo "var3 holds $var3"
    echo "var4 holds $var4"
    echo "Writing these variables to file for future Gitbash shell instances to read..."
    echo $var3 > $LOCAL_VAR_SSH_AGENT_VARS_FILENAME
    echo $var4 >> $LOCAL_VAR_SSH_AGENT_VARS_FILENAME
fi

}



##----------------------------------------------------------------------
##
##  SECTION - main line code of dot-bash-amendments.sh
##
##----------------------------------------------------------------------

if [ $DBM_MESSAGING_LEVEL -gt $DBM_MESSAGES_QUIET ]; then
    echo "starting,"
fi

## Following test fails when script passed an argument, should succeed . . .
#if [[ "$ARGC" -eq "1" ]]; then
#    echo "called with first argument set to '$1',"
#fi

## Following test succeeds:
#if [[ "$#" -eq "1" ]]; then
if [ $# -eq 1 ]; then
    echo "called with first argument set to '$1',"
#    echo "calling 'read directory bookmarks file' with no arguments . . ."
#    read_bookmarks_file
else
    echo "called with $# arguments, parsing implementation underway 2021-09-28 . . ."
fi


# NEED TO MOVE THIS SCRIPT VARIABLE UP TO SECTION OF FILE-SCOPED VARIABLES:
bookmarks_dir="${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}"

## 2017-12-03 - DISCOVERY:  Bash 'file exists' test returns true when 
## +  the argument to the file test is a zero-length string or undefined variable.
## +  Does Mendel Cooper's guide explain this behavior?  There was a typo
## +  just below with 'bookmarks_dir' spelled 'booksmarks_dir' . . .  - TMH

if [ -e ${bookmarks_dir} ]; then
    if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
#        echo "found directory '${bookmarks_dir}' for bookmarked path files, not creating this directory."
        echo "found directory '${bookmarks_dir}' for bookmarked path files, not creating this directory." > /dev/null
    fi
else
    if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
        echo "creating directory ${bookmarks_dir} . . ."
    fi
    mkdir -pv ${bookmarks_dir}
fi


##----------------------------------------------------------------------
##  STEP:  set shell aliases specific to directory, path bookmarking
##----------------------------------------------------------------------

    set_aliases_for_bookmarking


#    echo "- DIAG BEGIN - calling function (not alias) to clear any directory bookmarks . . ."
    clear_paths_function
#    echo "- DIAG END - \$D1 holds '$D1'"


##----------------------------------------------------------------------
##  STEP - determine bookmarked paths file id from script arguments
##----------------------------------------------------------------------

##  *  https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash

    regex='^[0-9]+$'
    if [[ $1 =~ $regex ]]; then
        if [ "$#" -gt 0 ]; then
            bookmarks_group_id=$1
        else
## If script not passed valid bookmarks file ID then default to ID of 1:
            bookmarks_group_id=1
        fi
    fi


##----------------------------------------------------------------------
##  STEP - when passed valid bookmarks file ID write this to rc file
##----------------------------------------------------------------------

bookmarked_paths_group_in_script_main_line=$1

if [[ ${bookmarked_paths_group_in_script_main_line} =~ [1-9] ]] ; then
    if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
        echo "script called with bookmarks group number ${bookmarked_paths_group_in_script_main_line}, in range ${BOOKMARKS_GROUPS_SUPPORTED}"
        echo "which we support as of 2017 December."
    fi
    write_bookmarks_runtime_config ${bookmarked_paths_group_in_script_main_line}

##----------------------------------------------------------------------
##  STEP - when running without bookmarks file ID then read directory bookmarker's rc file
##----------------------------------------------------------------------

else
    if [ -z ${bookmarked_paths_group_in_script_main_line} ]; then
        if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
            echo "script called without bookmarked paths group specified,"
            echo "looking for last-used bookmarks group in dot-bash-amendments run-time config file . . ."
        fi
        bookmarks_group_id=$(read_bookmarks_runtime_config)
        if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
            echo "- DEV - from rc file read bookmarks group id '${bookmarks_group_id}',"
        fi
    else

##----------------------------------------------------------------------
##  STEP - may be redundant but when we see invalid bookarms file ID here set ID to default value of 1
##----------------------------------------------------------------------

        if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
            echo "- NOTE - script called with unsupported bookmarks group id,"
            echo "- NOTE - id we got is '${bookmarked_paths_group_in_script_main_line}',"
            echo "- NOTE - setting bookmarks group to default value of 1, first group of bookmarks among ${BOOKMARKS_GROUPS_SUPPORTED}"
        fi
        bookmarked_paths_group_in_script_main_line=1
    fi
fi


##----------------------------------------------------------------------
##  STEP - read bookmarked paths from file
##----------------------------------------------------------------------

if [ $DBM_MESSAGING_LEVEL -ge $DBM_MESSAGES_ERRORS_WARNINGS_INFO_VERBOSE ]; then
    echo "calling 'read directory bookmarks file' with arguments '$0 ${bookmarks_group_id}' . . ."
fi
read_bookmarks_file $0 ${bookmarks_group_id}


##----------------------------------------------------------------------
##  STEP - amend or restore given user PATH variable
##----------------------------------------------------------------------

    if [ "$1" == "restore-path-variable" ]; then 
## NEED TO TEST WHETHER RESTORE VALUE OF PATH VARIABLE IS CORRECT ON
## SECOND AND SUCCESSIVE EXECUTIONS OF THIS SCRIPT IN A MULTIPLE
## LOGIN SCENARIO FOR A SINGLE USER (THIS MAY NOT WORK AS DESIGNED):
echo "- dbm - RESTORING PATH VARIABLE . . ."
        restore_path_variable_to_as_found
    else
        amend_path_variable
    fi


## { DEVELOPMENT BLOCK BEGIN

## See http://tldp.org/LDP/abs/html/testconstructs.html, example script 7-1:

if [ ]; then
    echo ""
    echo "- DIAG START in main-line code of script -"
    echo "back from call to read_bookmarks_file() which exports \$D1..\$D30,"
    echo "\$D1 holds '$D1',"
    echo "\$D2 holds '$D2',"
    echo "\$D3 holds '$D3',"
    echo "- DIAG END in main-line code of script -"
    echo ""
fi

## } DEVELOPMENT BLOCK END



## NOTE:  following "steps" of this script carry out environment
##  changes beyond directory book marking.  These amendments to given
##  user's environment can be turned on and off by setting
##  corresponding "DBM_ENABLE_" variables in this script's section
##  with title "SCRIPT VARIABLES".

##----------------------------------------------------------------------
##  STEP - set aliases for standard Unix and Linux commands
##----------------------------------------------------------------------

if [ $DBM_ENABLE_STANDARD_COMMAND_ALIASES -eq 1 ]; then
#    if [ -e $bookmarks_dir/z--dbm--alias-standard-commands.sh ]; then
    if [ ]; then
        if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
            echo "sourcing function to set aliases for standard Linux commands"
        fi
#echo "- DEV - sourcing function to set aliases for standard Linux commands . . ."
echo "- DEV - sourcing script to set aliases for standard Linux commands . . ."
        . $bookmarks_dir/z--dbm--alias-standard-commands.sh
#        dbm_set_aliases
    else
        if [ $DBM_LOOK_FOR_HELPER_SCRIPTS_IN_DEFAULT_AND_DEV_LOCATION -eq 1 ]; then
            if [ -e ./dbm-helper-scripts/z--dbm--alias-standard-commands.sh ]; then
#echo "- DEV - from second location sourcing function to set aliases for standard Linux commands . . ."
echo "- DEV - from second location sourcing script to set aliases for standard Linux commands . . ."
                aaa=`. ./dbm-helper-scripts/z--dbm--alias-standard-commands.sh $DBM_MESSAGING_LEVEL`
#                aaa=`./dbm-helper-scripts/z--dbm--alias-standard-commands.sh`
echo "- DEV - script to alias standard commands returns \"$aaa\","                 
#                dbm_set_aliases
            else
                if [ $DBM_MESSAGING_LEVEL -eq 1 ]; then
                    echo "WARNING from DBM - no script function found to set aliases for standard Linux commands"
                fi
            fi
        fi
    fi
fi


##----------------------------------------------------------------------
##  STEP - declare and assign custom environment variables
##----------------------------------------------------------------------

if [ $DBM_ENABLE_CUSTOM_ENVIRONMENT_VARIABLE_SETTING -eq 1 ]; then
    if [ -e ${bookmarks_dir}/z--dbm--set-custom-environment-vars.sh ]; then
        echo "- DEV - sourcing function to set custom shell environment variables . . ."
        . ${bookmarks_dir}/z--dbm--set-custom-environment-vars.sh
    else
# DBM_LOOK_FOR_HELPER_SCRIPTS_IN_DEFAULT_AND_DEV_LOCATION
        if [ $DBM_LOOK_FOR_HELPER_SCRIPTS_IN_DEFAULT_AND_DEV_LOCATION -eq 1 ]; then
            echo "- DEV - sourcing function to set custom shell environment variables . . ."
            if [ -e ./dbm-helper-scripts/z--dbm--set-custom-environment-vars.sh ]; then
                . ./dbm-helper-scripts/z--dbm--set-custom-environment-vars.sh
            fi
        fi
    fi
fi


##----------------------------------------------------------------------
##  STEP - modify default regular user prompt string setting
##----------------------------------------------------------------------

## 2021-08-15 - Amending prompt string to keep local hostname private:
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
if [ $DBM_AMEND_LOCAL_PROMPT_SCRIPT -eq 1 ]; then
    echo "amending PS1,"
    PS1='${debian_chroot:+($debian_chroot)}\u@localhost:\w\$ '
fi


## 2021-09-20 - Searching for ssh-agent process to obtain PID
find_ssh_agent_pid


if [ $DBM_MESSAGING_LEVEL -ge $DBM_MESSAGES_ERRORS_WARNINGS_INFO ]; then
    echo "done."
fi


# EOF ( end of file )
