

##----------------------------------------------------------------------
##  STEP - declare and assign custom environment variables
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


function set_custom_environment_vars()
{
# Concurrent Versions System (CVS) variables:

    CVSROOT="/home/fulano/cvs"
    CVS_RSH=""
    export EDITOR=/usr/bin/vi

    HISTSIZE=1000
    HISTFILESIZE=1000

# Enable tsocks transparent proxy service by setting this environment
# variable:

## Note - needed back in 2004, 2005 for to enable proxy server
##  settings . . .

#    export LD_PRELOAD=/lib/libtsocks.so.1.8
#    export LD_PRELOAD=/usr/lib/libtsocks.so.1.8


    export SESSION_MANAGER=lightdm


##----------------------------------------------------------------------
##  2014-02-19 - added by Ted . . .
##
##  STEP - cross compile variables to export
##
##  reference http://www.x.org/wiki/CrossCompilingXorg/
##----------------------------------------------------------------------


## 2021-07-21 TUE - Ted commenting out this variable, it is causing `west` zephyr builds to fail:
export CROSS_COMPILE=arm-zephyr-eabi-
export ZEPHYR_SDK_INSTALL_DIR=${HOME}/zephyrproject/zephyr
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr

}
