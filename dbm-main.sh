#!/bin/bash

# ----------------------------------------------------------------------
# - SECTION - script functions
# ----------------------------------------------------------------------

function dmsg()
{
    if [[ $1 -eq $DIAG_ON ]]; then
        echo $2
    fi
}

function set_dbm_path()
{
    # Note this function needed because .bashrc is called from/in an environment
    # where `pwd` reports current directory as user's home dir.
    echo "/home/ted/projects/directory-book-marker"
}

# TODO [ ] Review following function 'show_aliases_in_this_script()' . . .

function show_aliases_in_this_script()
{
## 2017-12-02 NEED - Contributor Ted noting that following command will
##  show all script lines, including comments and commented out
##  commands (which are also comments), which this function's name
##  does not indicate.  NEED to fix this or rename this function . . .

    $(GREP) -n 'alias ' $0
}

function set_aliases_for_bookmarking()
{
    alias cb='echo "directory bookmarks group set to group ${bookmarks_group_id},"'

# STEP:  create aliases for saving paths and returning to paths

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

alias announce_new_dir='if (( $? && 1 )); then echo "- ${SCRIPT_ABBR} - dir not found!"; else echo "now at $PWD"; fi'

# navigation to bookmarked directories 1 through 10:

#    alias gd1='cd $D1; echo "Now at $D1" '
    alias gd1='cd $D1; if (( $? && 1 )); then echo "- ${SCRIPT_ABBR} - dir not found!"; else echo "now at $PWD"; fi'
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
    alias gd27='cd $D27; if (( $? && 1 )); then echo "- ${SCRIPT_ABBR} - dir not found!"; else echo "now at $PWD"; fi'
    alias gd28='cd $D28; announce_new_dir'
    alias gd29='cd $D29; announce_new_dir'
    alias gd30='cd $D30; announce_new_dir'

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  Banner message at end of alias 's' . . .
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

DBPS="G${bookmarks_group_id}"
alias s='
echo
echo "Bookmarked paths in bookmarks group ${bookmarks_group_id} are:"
echo "(use 'gd1', 'gd2', etc to go to bookmarked directory)"
echo

echo "$DBPS _gd1 $D1";
echo "$DBPS _gd2 $D2";
echo "$DBPS _gd3 $D3";
echo "$DBPS _gd4 $D4";
echo "$DBPS _gd5 $D5";

echo "$DBPS _gd6 $D6";
echo "$DBPS _gd7 $D7";
echo "$DBPS _gd8 $D8";
echo "$DBPS _gd9 $D9";
echo "$DBPS gd10 $D10";

echo " - - - - -";
echo "$DBPS gd11 $D11";
echo "$DBPS gd12 $D12";
echo "$DBPS gd13 $D13";
echo "$DBPS gd14 $D14";
echo "$DBPS gd15 $D15";

echo "$DBPS gd16 $D16";
echo "$DBPS gd17 $D17";
echo "$DBPS gd18 $D18";
echo "$DBPS gd19 $D19";
echo "$DBPS gd20 $D20";

echo " - - - - -";
echo "$DBPS gd21 $D21";
echo "$DBPS gd22 $D22";
echo "$DBPS gd23 $D23";
echo "$DBPS gd24 $D24";
echo "$DBPS gd25 $D25";

echo "$DBPS gd26 $D26";
echo "$DBPS gd27 $D27";
echo "$DBPS gd28 $D28";
echo "$DBPS gd29 $D29";
echo "$DBPS gd30 $D30";
echo;
echo EDITOR is set to: $EDITOR;
'

##------------------------------------------------------------------------------

alias sp='bookmarked_path[0]="zztop"; 
bookmarked_path[1]=$D1 bookmarked_path[2]=$D2
bookmarked_path[3]=$D3 bookmarked_path[4]=$D4
bookmarked_path[5]=$D5 bookmarked_path[6]=$D6
bookmarked_path[7]=$D7 bookmarked_path[8]=$D8
bookmarked_path[9]=$D9 bookmarked_path[10]=$D10

bookmarked_path[11]=$D11 bookmarked_path[12]=$D12
bookmarked_path[13]=$D13 bookmarked_path[14]=$D14
bookmarked_path[15]=$D15 bookmarked_path[16]=$D16
bookmarked_path[17]=$D17 bookmarked_path[18]=$D18
bookmarked_path[19]=$D19 bookmarked_path[20]=$D20

bookmarked_path[21]=$D21 bookmarked_path[22]=$D22
bookmarked_path[23]=$D23 bookmarked_path[24]=$D24
bookmarked_path[25]=$D25 bookmarked_path[26]=$D26
bookmarked_path[27]=$D27 bookmarked_path[28]=$D28
bookmarked_path[29]=$D29 bookmarked_path[30]=$D30

## 2017-12-14 THU:
  echo "about to save bookmarked paths using old script code in alias," 
  echo "in this code \$filename holds '$filename'," 
  echo "to local file $filename saving bookmarked directories:";
  echo -n > $filename; 
  for index in 0  1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16 17 18 19 20  21 22 23 24 25 26 27 28 29 30; do
      echo "saving bookmarked path $index = ${bookmarked_path[$index]}"; 
      echo ${bookmarked_path[$index]} >> $filename; 
  done'

alias clearpaths='
echo "Clearing bookmarked paths in present shell . . ."
echo "Note:  bookmarked paths in bookmarks group ${bookmarks_group_id} still stored in ${filename}"
echo "use 'lp${bookmarks_group_id}' to reload those bookmarked paths."
export D1=""; export D2=""; export D3=""; export D4=""; export D5="";
export D6=""; export D7=""; export D8=""; export D9=""; export D10="";

export D11=""; export D12=""; export D13=""; export D14=""; export D15="";
export D16=""; export D17=""; export D18=""; export D19=""; export D20="";

export D21=""; export D22=""; export D23=""; export D24=""; export D25="";
export D26=""; export D27=""; export D28=""; export D29=""; export D30="";'

# 2017-12-02 - NEED TO ADDRESS INTENT AND ACTION OF load-paths:
# This alias likely doesn't work as intended, to load one set
# of bookmarked paths over others . . .    - TMH

alias load-paths='
export D1=${bookmarked_path[1]};
export D2=${bookmarked_path[2]};
export D3=${bookmarked_path[3]};
export D4=${bookmarked_path[4]};
export D5=${bookmarked_path[5]};
export D6=${bookmarked_path[6]};
export D7=${bookmarked_path[7]};
export D8=${bookmarked_path[8]};
export D9=${bookmarked_path[9]};
export D10=${bookmarked_path[10]};

export D11=${bookmarked_path[11]};
export D12=${bookmarked_path[12]};
export D13=${bookmarked_path[13]};
export D14=${bookmarked_path[14]};
export D15=${bookmarked_path[15]};
export D16=${bookmarked_path[16]};
export D17=${bookmarked_path[17]};
export D18=${bookmarked_path[18]};
export D19=${bookmarked_path[19]};
export D20=${bookmarked_path[20]};

export D21=${bookmarked_path[21]};
export D22=${bookmarked_path[22]};
export D23=${bookmarked_path[23]};
export D24=${bookmarked_path[24]};
export D25=${bookmarked_path[25]};
export D26=${bookmarked_path[26]};
export D27=${bookmarked_path[27]};
export D28=${bookmarked_path[28]};
export D29=${bookmarked_path[29]};
export D30=${bookmarked_path[30]};
echo "Loaded user-saved paths:"; s'

# Aliases to load different groups of bookmarked paths:

if [[ 0 ]]; then
	echo "M1"
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
fi

# TODO [ ] HIGH PRIORITY find way for script to identify its full path,
#           so we may remove this hard-coded path:

link_to_dbm="$HOME/projects/directory-book-marker/dbm-main.sh"
    alias lp1='. $link_to_dbm 1'
    alias lp2='. $link_to_dbm 2'
    alias lp3='. $link_to_dbm 3'
    alias lp4='. $link_to_dbm 4'
    alias lp5='. $link_to_dbm 5'

    alias lp6='. $link_to_dbm 6'
    alias lp7='. $link_to_dbm 7'
    alias lp8='. $link_to_dbm 8'
    alias lp9='. $link_to_dbm 9'
    alias lp1link_to_dbm='. $link_to_dbm 1link_to_dbm'

# 2017-12-14 - Alias 'show non-empty bookmarks' added by Ted:

    alias sne='
echo
echo "Showing non-empty bookmarks in bookmarks group ${bookmarks_group_id}:"
echo

bookmarked_path[1]=$D1; bookmarked_path[2]=$D2;
bookmarked_path[3]=$D3; bookmarked_path[4]=$D4;
bookmarked_path[5]=$D5; bookmarked_path[6]=$D6;
bookmarked_path[7]=$D7; bookmarked_path[8]=$D8;
bookmarked_path[9]=$D9; bookmarked_path[10]=$D10;

bookmarked_path[11]=$D11; bookmarked_path[12]=$D12;
bookmarked_path[13]=$D13; bookmarked_path[14]=$D14;
bookmarked_path[15]=$D15; bookmarked_path[16]=$D16;
bookmarked_path[17]=$D17; bookmarked_path[18]=$D18;
bookmarked_path[19]=$D19; bookmarked_path[20]=$D20;

bookmarked_path[21]=$D21; bookmarked_path[22]=$D22;
bookmarked_path[23]=$D23; bookmarked_path[24]=$D24;
bookmarked_path[25]=$D25; bookmarked_path[26]=$D26;
bookmarked_path[27]=$D27; bookmarked_path[28]=$D28;
bookmarked_path[29]=$D29; bookmarked_path[30]=$D30;

for index in 1 2 3 4 5 6 7 8 9 10  11 12 13 14 15 16 17 18 19 20  21 22 23 24 25 26 27 28 29 30; do

if [ -z ${bookmarked_path[$index]} ]; then
    echo "bookmarked_path[$index] not set," >> /dev/null
else
    echo "\$D${index} set to ${bookmarked_path[$index]},"
fi
done

echo'

}

# TODO [ ] Test how "read runtime config" function works when rc file absent:

function read_bookmarks_runtime_config()
{
    local line="DEFAULT_LINE_TO_BE_READ_FROM_FILE"
    local bookmarks_group_id=""
    
    filename=${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}/${FILENAME_DBM_RC}

    if [ -e ${filename} ]; then
        read -r line < ${filename}
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
}

function write_bookmarks_runtime_config()
{
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  2017-12-14 - Script contributor Ted noting that this function to
##   write the bookmarks run-time config file is nearly identical to
##   the function to read this same file.  Wondering if there's an
##   elegant way to combine the two functions?  - TMH
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    dmsg $DIAG_OFF "* * * function write_bookmarks_runtime_config() implementation underway * * *"
    echo "called with bookmarks group identifier '${1}',"

    filename=${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}/${FILENAME_DBM_RC}

    if [ -e ${filename} ]; then
        # write one value bookmarked paths runtime config file, overwriting all data in this file:
        echo "${SCRIPT_NAME}:  writing directory bookmarks runtime configuration file . . ."
        echo ${1} > ${filename}
    else
        touch ${filename}
        if [ -e ${filename} ]; then
            echo ${1} > ${filename}
        else
            echo "${SCRIPT_NAME}:  - WARN - unable to open and unable to create runtime config file!"
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
        dmsg $DIAG_OFF  "caller requests valid bookmarks file identified by '${2}'"
    else
        echo "- NOTE - caller requests unsupported bookmarks file identified by '${2}',"
        echo "- NOTE - reading bookmarks from default group 1 . . ."
        bookmarked_paths_group=1
    fi

    bookmarks_filename=$(echo ${FILENAME_FORM_OF_BOOKMARKED_PATHS} | ${SED} s/nn/0${bookmarked_paths_group}/)

    dmsg $DIAG_OFF "will read bookmarks from file named ${bookmarks_filename},"

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

filename=${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}/${bookmarks_filename}

## 2017-02-09 THU - To be added, support for storing and perusing multiple directory bookmarks files:
filename__list_of_bookmark_files="${HOME}/bookmarked-path-files.txt"

# REFERENCE:  http://tldp.org/LDP/abs/html/arrays.html

    declare -a bookmarked_path=()

    if [ -e ${filename} ]; then
        bookmarked_path=( $(cat "$filename") )  #  Stores contents of this script
                                                #+ ($bash_settings_local) in an array.
    else
        echo "${SCRIPT_NAME}:  - WARN - direcory bookmarks file named ${filename} not found!"
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
}

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
##----------------------------------------------------------------------

    string=`echo $PATH | grep $DBM_WATERMARK`

    if [ -z "$string" ]
    then
        path_as_found=${PATH}

# Amending the default path variable:

        PATH="${PATH}":${HOME}/.local/bin
        PATH="${PATH}":/sbin
        PATH="${PATH}":/usr/sbin
        PATH="${PATH}":/opt/bin
        PATH="${PATH}":/opt/cross/bin
        PATH="${PATH}":/opt/nxp/lpcxpresso-8p2p2/lpcxpresso/tools/bin
        PATH="${PATH}":/opt/nxp/lpcxpresso-8p2p2/lpcxpresso
        PATH="${PATH}":/opt/cross/x-tools/arm-unknown-linux-gnueabi/bin
        PATH="${PATH}":${HOME}/bin
        PATH="${PATH}":/usr/local/mysql/bin
        PATH="${PATH}":/usr/lib/xscreensaver
        PATH="${PATH}":/etc/init.d

# 2014-01-24 . . .
        PATH="${PATH}":/var/opt/sam-ba_cdc_cdc_linux

# 2017-12-04 . . .
        PATH="${PATH}":~/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin

# 2026-01-26
        PATH="${PATH}":$HOME/.bookmarked-paths/scripts/helpers

# 2018-01-19 - add a pattern to the path to avoid multple path variable
#  amendments per shell session:
        PATH="${PATH}:$DBM_WATERMARK"

    else
        echo "\$PATH variable already amended, directory book-marker leaving untouched."
    fi

}

function restore_path_variable_to_as_found()
{
    PATH=$path_as_found
}

# ----------------------------------------------------------------------
# - SECTION - variables
# ----------------------------------------------------------------------

GREP=/bin/grep
SED=/bin/sed

DIAG_ON=1
DIAG_OFF=0

SCRIPT_NAME_BY_INVOCATION=$0
# echo "\$SCRIPT_NAME assigned value of \${0} and holds ${SCRIPT_NAME},"
SCRIPT_NAME="dot-bash-amendments.sh"
SCRIPT_ABBR="dbm"

DIRECTORY_OF_BOOKMARKS_FILES=".bookmarked-paths"

FILENAME_FORM_OF_BOOKMARKED_PATHS="bookmarked-paths-nn.txt"

FILENAME_DBM_RC="bookmarked-paths.rc"

BOOKMARKS_GROUPS_SUPPORTED="1..9"

# Directory Book Marker watermark, for sane $PATH amendments:
DBM_WATERMARK="${HOME}/path-amended-by-directory-bookmarker"

# . . .
bookmarks_group_id=1

# Shell variable used in 'sp' alias to save bookmarked paths:
index=0

## 2017-12-02 - How are these variables used? - TMH
bash_settings_file="${HOME}/.bash_settings_local"

# ----------------------------------------------------------------------
# - SECTION - akin to int main
# ----------------------------------------------------------------------

echo "starting,"

if [[ "$#" -eq "1" ]]; then
    echo "called with one argument which is set to '$1',"
fi

## Note:  single brackets in the following test work, double brackets
##  seem to evaulate differently, may be because we're using a shell
##  file test . . .

bookmarks_dir="${HOME}/${DIRECTORY_OF_BOOKMARKS_FILES}"

# echo "- DEV - constructed bookmarked paths directory which holds '$bookmarks_dir',"
## 2017-12-03 - DISCOVERY:  hey why does bash 'file exists' test return true when
## +  the argument to the file test is a zero-length string?  Or undefined variable?
## +  Does Mendel Cooper's guide explain this behavior?  There was a typo
## +  just below with 'bookmarks_dir' spelled 'booksmarks_dir' . . .  - TMH

if [ -e ${bookmarks_dir} ]; then
#    echo "found directory '${bookmarks_dir}' for bookmarked path files, not creating this directory."
    echo "found directory '${bookmarks_dir}' for bookmarked path files, not creating this directory." > /dev/null
else
#    echo "creating directory ${bookmarks_dir} . . ."
    mkdir -pv ${bookmarks_dir}
fi

##----------------------------------------------------------------------
##  STEP - read file holding bookmarked paths
##----------------------------------------------------------------------

    clear_paths_function

##  *  https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash

    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then
        if [ "$#" -gt 0 ]; then
            bookmarks_group_id=${1}
        else
            bookmarks_group_id=1
        fi
    fi

##----------------------------------------------------------------------
##  STEP - check for valid bookmarks group identifier, should be
##  an integer value between 1 and 9 for now, 2017 December:
##----------------------------------------------------------------------

bookmarked_paths_group_in_script_main_line=${1}

if [[ ${bookmarked_paths_group_in_script_main_line} =~ [1-9] ]] ; then
    echo "script called with bookmarks group number ${bookmarked_paths_group_in_script_main_line}, in range ${BOOKMARKS_GROUPS_SUPPORTED}"
    echo "which we support as of 2017 December."
    write_bookmarks_runtime_config ${bookmarked_paths_group_in_script_main_line}
else
    if [ -z ${bookmarked_paths_group_in_script_main_line} ]; then
        dmsg $DIAG_OFF "script called without bookmarked paths group specified,"
        # echo "looking for last-used bookmarks group in dot-bash-amendments run-time config file . . ."
        bookmarks_group_id=$(read_bookmarks_runtime_config)
        dmsg $DIAG_OFF "- DEV - from bookmarks rc file read bookmarks group id '${bookmarks_group_id}',"
    else
        echo "- NOTE - script called with unsupported bookmarks group id,"
        echo "- NOTE - id we got is '${bookmarked_paths_group_in_script_main_line}',"
        echo "- NOTE - setting bookmarks group to default value of 1, first group of bookmarks among ${BOOKMARKS_GROUPS_SUPPORTED}"
        bookmarked_paths_group_in_script_main_line=1
    fi
fi

    dmsg $DIAG_OFF "- DEV 0220 - bookmarks group set to " $bookmarks_group_id
    dmsg $DIAG_OFF "- DEV 0220 - calling function to set bookmarking aliases . . ."
    set_aliases_for_bookmarking

# echo "calling bash amendments function to read run-time config file . . ."
# read_bookmarks_runtime_config

echo "calling 'read directory bookmarks file' with arguments '$0 ${bookmarks_group_id}' . . ."
read_bookmarks_file $0 ${bookmarks_group_id}

##----------------------------------------------------------------------
##  STEP - amend environment variables
##----------------------------------------------------------------------

#
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  NOTE - path environment variable amendments, mostly for
##   work on Debian and Ubuntu Linux based systems
##
##  NOTE - when $PATH variable includes present working directory, e.g.
##   "." then buildroot 2.x complains and bails during project
##   compilation.  For smooth buildroot project builds, keep the 
##   current working directory commented out.  Safer to run programs
##   in cwd using ./[program_name] syntax anyway . . .  - TMH
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#

# Amending the default path variable:

    if [ "$1" == "restore-path-variable" ]; then 
echo "- dbm - RESTORING PATH VARIABLE . . ."
        restore_path_variable_to_as_found
    else
        amend_path_variable
    fi

    # TODO [ ] Check whether both these history variables are necessary:
    HISTSIZE=1000
    HISTFILESIZE=1000

#// TODO [ ] This looks like it is written to be an alias, but it is not a shell
#//  alias so annotate it and factor it to an appropriate place in the revamped
#//  directory bookmarker scripts of 2026:
# Variables as shortcuts:
    archive=${HOME}/archive

# Call directory bookmarks script to set custom aliases:

# Note this may be a dev-only necesity, to set directory bookmarker path
# manually:
bookmarks_helpers_dir=`set_dbm_path`
aliases_file=$bookmarks_helpers_dir/scripts/aliases.sh

if [ -e $aliases_file ]; then
    . $aliases_file
else
    echo "- WARN - no directory bookmarks helper found to set custom aliases"
    echo "- WARN - tried $aliases_file"
    echo "- WARN - current dir is:"
    pwd
fi

# TODO [ ] Factor exported environment variables to a shell function

# TODO [ ] Consider setting editor to /usr/bin/vim, check whether this exists
#  Debian package vim-tiny is installed by default:
    export EDITOR=/usr/bin/vi

# echo "done."
