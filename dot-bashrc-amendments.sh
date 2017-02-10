#!/bin/bash

##----------------------------------------------------------------------
##
##
##  FILE:  .bashrc-amendments, also named dot-bashrc-amendments.sh
##
##
##  LAST TOUCHED:  2017-02-10 FRI
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
##    or alternately for convenience a given user may amond their
##    .login or .bashrc start-up script to include a line which
##    does the same sourcing of this file.
##
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
##
##
##
##
##  REFERENCES:
##
##    See 'The Linux Documentation Project' at http://tldp.org/
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



GREP=/bin/grep



## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  SECTION - aliases
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function show_aliases_in_this_script()
{
    $(GREP) -n alias $0
}




## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  SECTION - path environment variable amendments, mostly for
##   work on Debian and Ubuntu Linux based systems
##
##
##  NOTE - when $PATH variable includes present working directory, e.g.
##   "." then buildroot 2.x complains and bails during project
##   compilation.  For smooth buildroot project builds, keep the 
##   current working directory commented out.  Safer to run programs
##   in cwd using ./[program_name] syntax anyway . . .  - TMH
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# Amending the default path variable:

#    PATH="/usr/bin:${PATH}"
    PATH="${PATH}":/sbin
    PATH="${PATH}":/usr/sbin
    PATH="${PATH}":/opt/cross/bin
    PATH="${PATH}":/opt/cross/x-tools/arm-unknown-linux-gnueabi/bin
#    PATH="${PATH}":.
    PATH="${PATH}":${HOME}/bin
    PATH="${PATH}":/usr/local/mysql/bin
    PATH="${PATH}":/usr/lib/xscreensaver
    PATH="${PATH}":/etc/init.d

# 2014-01-24 . . .

    PATH="${PATH}":/var/opt/sam-ba_cdc_cdc_linux



# Concurrent Versions System (CVS) variables:

    CVSROOT="/home/fulano/cvs"
    CVS_RSH=""
#    export EDITOR=/usr/bin/vim . . . commented out 2012-01-25 - TMH
    export EDITOR=/usr/bin/vi
    HISTSIZE=1000
    HISTFILESIZE=1000

# Variables as shortcuts:

    archive=${HOME}/archive

# Enable tsocks transparent proxy service by setting this environment
# variable:

## Note - needed back in 2004, 2005 for to enable proxy server
##  settings . . .

#    export LD_PRELOAD=/lib/libtsocks.so.1.8
#    export LD_PRELOAD=/usr/lib/libtsocks.so.1.8



## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  SECTION - aliases
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'

# list files in long format starting from a cleared screen:
    alias lss='clear; ls -lF'

# list directories only in long format:
    alias dls='ls -l | grep "^d"'

# run custom Remote UPtime script:
    alias rup='${HOME}/bin/rup'

# . . .
    alias cvs='cvs -d /home/ted/cvs -e /usr/bin/vi'



    alias archive='cd ${HOME}/archive; echo "Now at `pwd`" '
    alias bin='cd ${HOME}/bin; echo "Now at `pwd`" '
    alias notes='cd ${HOME}/notes; echo "Now at `pwd`" '
    alias docs='cd /var/www/alta/docs; echo "Now at `pwd`" '

    alias alta='cd ${HOME}/alta; echo "Now at `pwd`" '


# 2012-01-25
    alias xterm='xterm -bg black -fg white -geometry 108x36'
    alias x='xterm -bg black -fg white -geometry 115x36 &'

    alias xlock='/usr/bin/xlock -mode scooter -count 100'





## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  STEP:  retrieve saved paths from previous user session
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

line=""
index=0
bash_settings_file="${HOME}/.bash_settings_local"

# filename="${HOME}/.bash_paths_saved"
filename="${HOME}/bookmarked-paths.txt"
filename__present_bookmarks=${filename}

## 2017-02-09 THU - To be added, support for storing and perusing multiple directory bookmarks files:
filename__list_of_bookmark_files="${HOME}/bookmarked-path-files.txt"





declare -a pathlist=()

if [ -e ${filename} ]; then
    pathlist=( $(cat "$filename") )  #  Stores contents of this script
                                     #+ ($bash_settings_local) in an array.
else
    echo "$O:  no local bash settings file named ${bash_settings_file} found," > /dev/null
fi



## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
##  NOTE - had trouble getting these export statements to fly . . .
## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *


# export ${pathlist[0]}
# export ${pathlist[1]}
# export ${pathlist[2]}
# export ${pathlist[3]}
# export ${pathlist[4]}
# export ${pathlist[5]}


# 2006-11-27
# Prior to storing user-saved paths in a local file, path
# variables were assigned zero-length strings and exported like this:
#
# export D1=""
#
# Now these variables are exported the same way but assigned
# differently . . .

# echo "reading saved paths from file, skipping first place-holder token '${pathlist[0]}' . . ."

export D1=${pathlist[1]}
export D2=${pathlist[2]}
export D3=${pathlist[3]}
export D4=${pathlist[4]}
export D5=${pathlist[5]}

export D6=${pathlist[6]}
export D7=${pathlist[7]}
export D8=${pathlist[8]}
export D9=${pathlist[9]}
export D10=${pathlist[10]}

export D11=${pathlist[11]}
export D12=${pathlist[12]}
export D13=${pathlist[13]}
export D14=${pathlist[14]}
export D15=${pathlist[15]}

export D16=${pathlist[16]}
export D17=${pathlist[17]}
export D18=${pathlist[18]}
export D19=${pathlist[19]}
export D20=${pathlist[20]}

export D21=${pathlist[21]}
export D22=${pathlist[22]}
export D23=${pathlist[23]}
export D24=${pathlist[24]}
export D25=${pathlist[25]}

export D26=${pathlist[26]}
export D27=${pathlist[27]}
export D28=${pathlist[28]}
export D29=${pathlist[29]}
export D30=${pathlist[30]}




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



# navigation to bookmarked directories 1 through 10:

alias gd1='cd $D1; echo "Now at $D1" '
alias gd2='cd $D2; echo "Now at $D2" '
alias gd3='cd $D3; echo "Now at $D3" '
alias gd4='cd $D4; echo "Now at $D4" '
alias gd5='cd $D5; echo "Now at $D5" '

alias gd6='cd $D6; echo "Now at $D6" '
alias gd7='cd $D7; echo "Now at $D7" '
alias gd8='cd $D8; echo "Now at $D8" '
alias gd9='cd $D9; echo "Now at $D9" '
alias gd10='cd $D10; echo "Now at $D10" '

# navigation to bookmarked directories 11 through 20:

alias gd11='cd $D11; echo "Now at $D11" '
alias gd12='cd $D12; echo "Now at $D12" '
alias gd13='cd $D13; echo "Now at $D13" '
alias gd14='cd $D14; echo "Now at $D14" '
alias gd15='cd $D15; echo "Now at $D15" '

alias gd16='cd $D16; echo "Now at $D16" '
alias gd17='cd $D17; echo "Now at $D17" '
alias gd18='cd $D18; echo "Now at $D18" '
alias gd19='cd $D19; echo "Now at $D19" '
alias gd20='cd $D20; echo "Now at $D20" '

# navigation to bookmarked directories 21 through 30:

alias gd21='cd $D21; echo "Now at $D21" '
alias gd22='cd $D22; echo "Now at $D22" '
alias gd23='cd $D23; echo "Now at $D23" '
alias gd24='cd $D24; echo "Now at $D24" '
alias gd25='cd $D25; echo "Now at $D25" '

alias gd26='cd $D26; echo "Now at $D26" '
alias gd27='cd $D27; echo "Now at $D27" '
alias gd28='cd $D28; echo "Now at $D28" '
alias gd29='cd $D29; echo "Now at $D29" '
alias gd30='cd $D30; echo "Now at $D30" '



## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  SECTION - aliases to show, to save and to load bookmarked paths
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# alias s='echo variable D1 points to $D1; \
# echo variable D2 points to $D2; \
# echo variable D3 points to $D3; echo variable D4 points to $D4; \
# echo variable D5 points to $D5; echo variable D6 points to $D6; \
# echo variable D7 points to $D7; echo variable D8 points to $D8; \
# echo variable D9 points to $D9; echo variable D10 points to $D10; \
# \
# echo variable D11 points to $D11; \
# echo variable D12 points to $D12; \
# echo variable D13 points to $D13; \
# echo variable D14 points to $D14; \
# echo variable D15 points to $D15; \
# \
# echo variable D16 points to $D16; \
# echo variable D17 points to $D17; \
# echo variable D18 points to $D18; \
# echo variable D19 points to $D19; \
# echo variable D20 points to $D20; \
# \
# echo CVSROOT is set to: $CVSROOT; \
# echo CVS_RSH is set to: $CVS_RSH; \
# echo EDITOR is set to: $EDITOR'




## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##  Banner message at end of alias 's' . . .
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

alias s='\
echo " - - - - -";\
\
echo variable D1 points to $D1; echo variable D2 points to $D2; echo variable D3 points to $D3; echo variable D4 points to $D4; echo variable D5 points to $D5; echo variable D6 points to $D6; echo variable D7 points to $D7; echo variable D8 points to $D8; echo variable D9 points to $D9; echo variable D10 points to $D10;\
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
echo " - - - - -";\
\
# echo CVSROOT is set to: $CVSROOT; # echo CVS_RSH is set to: $CVS_RSH;\
echo EDITOR is set to: $EDITOR;\
echo "see file dot-bashrc-amendments.sh, typically in home directory of present user,";\
echo "for implementation of directory bookmarks and D1..D30 variables - TMH";\
echo "this shell script written by Ted Havelka and licensed under GNU Public License, 2005 - 2017";\
\
echo " - - - - -";'

##------------------------------------------------------------------------------





alias sp='pathlist[0]="zztop"; 
  pathlist[1]=$D1;    pathlist[2]=$D2;    pathlist[3]=$D3;    pathlist[4]=$D4;    pathlist[5]=$D5; 
  pathlist[6]=$D6;    pathlist[7]=$D7;    pathlist[8]=$D8;    pathlist[9]=$D9;    pathlist[10]=$D10; 
  pathlist[11]=$D11;  pathlist[12]=$D12;  pathlist[13]=$D13;  pathlist[14]=$D14;  pathlist[15]=$D15; 
  pathlist[16]=$D16;  pathlist[17]=$D17;  pathlist[18]=$D18;  pathlist[19]=$D19;  pathlist[20]=$D20; 

  pathlist[21]=$D21;  pathlist[22]=$D22;  pathlist[23]=$D23;  pathlist[24]=$D24;  pathlist[25]=$D25; 
  pathlist[26]=$D26;  pathlist[27]=$D27;  pathlist[28]=$D28;  pathlist[29]=$D29;  pathlist[30]=$D30; 

  echo "to local file $filename saving bookmarked directories:";
  echo -n > $filename; 
  for index in 0 1 2 3 4 5 6 7 8 9  10 11 12 13 14 15 16 17 18 19  20 21 22 23 24 25 26 27 28 29  30; do
      echo "saving bookmarked path $index = ${pathlist[$index]}"; 
      echo ${pathlist[$index]} >> $filename; 
  done '



alias clear-paths='\
export D1=""; export D2=""; export D3=""; export D4=""; export D5=""; \
export D6=""; export D7=""; export D8=""; export D9=""; export D10=""; \
\
export D11=""; export D12=""; export D13=""; export D14=""; export D15=""; \
export D16=""; export D17=""; export D18=""; export D19=""; export D20=""; \
\
export D21=""; export D22=""; export D23=""; export D24=""; export D25=""; \
export D26=""; export D27=""; export D28=""; export D29=""; export D30=""; \'



alias load-paths=' \
export D1=${pathlist[1]}; \
export D2=${pathlist[2]}; \
export D3=${pathlist[3]}; \
export D4=${pathlist[4]}; \
export D5=${pathlist[5]}; \
export D6=${pathlist[6]}; \
export D7=${pathlist[7]}; \
export D8=${pathlist[8]}; \
export D9=${pathlist[9]}; \
export D10=${pathlist[10]}; \
\
export D11=${pathlist[11]}; \
export D12=${pathlist[12]}; \
export D13=${pathlist[13]}; \
export D14=${pathlist[14]}; \
export D15=${pathlist[15]}; \
export D16=${pathlist[16]}; \
export D17=${pathlist[17]}; \
export D18=${pathlist[18]}; \
export D19=${pathlist[19]}; \
export D20=${pathlist[20]}; \
\
export D21=${pathlist[21]}; \
export D22=${pathlist[22]}; \
export D23=${pathlist[23]}; \
export D24=${pathlist[24]}; \
export D25=${pathlist[25]}; \
export D26=${pathlist[26]}; \
export D27=${pathlist[27]}; \
export D28=${pathlist[28]}; \
export D29=${pathlist[29]}; \
export D30=${pathlist[30]}; \
echo "Loaded user-saved paths:"; s'



##----------------------------------------------------------------------
##  2014-02-19 - added by Ted . . .
##
##  STEP - cross compile variables to export
##
##  reference http://www.x.org/wiki/CrossCompilingXorg/
##----------------------------------------------------------------------

# export CROSS_COMPILE=arm-none-linux-gnueabi-
export CROSS_COMPILE=arm-unknown-linux-gnueabi-



export SESSION_MANAGER=lightdm


# EOF ( end of file )
