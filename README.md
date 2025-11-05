------------------------------------------------------------------------
             Open Source Shell Based Directory Bookmarker
------------------------------------------------------------------------

## OVERVIEW:
Command line, directory bookmarking facility written in Bourne Again shell.  Really a path bookmarking facility.  Useful for work situations where multiple directories need be accessed and visited often from the command line.

## WHERE SUPPORTED:
Works in Unix and Linux shell environments, including Gitbash on Windows hosts.  Typically installed in given user's home directory.  Won't automatically run by its presence alone, but easy to activate automatically at login by sourcing this script from a standard shell login script such as .bashrc.

## INSTALL AND ENABLING:
Typical installation steps include,
1.  copy the main script 'dot-bashrc-amendments.sh' to given user's home directory.
2.  amend .bashrc and or .bash_login script to include stanzas which test for and source this main script.
An example of stanzas or lines added to source this script is:

<i>Code snippet 1 - script to source directory bookmarker:</i>
<pre>
if [ -f dot-bashrc-amendments.sh ]; then
    . dot-bashrc-amendments.sh
fi
</pre>

Note that the main script can also be installed in some alternate directory, such as a subdirectory of the end user or a shared system directly like /usr/local/bin or /usr/local/bin/startup.  When directory bookmarker script is installed in a path other than path of .bashrc or .bash_login, the above sourcing lines need be amended to spell out that path.  The bookmarking script can also be renamed.  In that case, again the .bashrc or .bash_profile lines to source directory bookmarker need to be amended with the alternate name of this script.

## BASIC USE:
Using a Unix or Linux shell which supports the `alias` command, this directory bookmarker script provides among its aliases the following shorthand patterns to set, to show, to navigate and further manage multiple directory paths:

*  's'           to show bookmarked full paths to directories,
*  'sdn'         to set bookmark n of 30, where n is a positive integer in the set 1..30
*  'gdn'         to change working directory to bookmarked path n of 30 path in the present group of paths
*  'sp'          to save bookmarked paths in present shell to text file

*  'lp1'         to load paths (bookmarked paths) group 1 out of groups 1..9
*  'clearpaths'  alias to clear bookmarked paths in present shell session / environment (1)

Notes:
(1)  bookmarker script alias `clearpaths` does not alter a user's present ${PATH} environment variable.  This alias only sets all the bookmarker variables to the null string "".

## TO-DO
This section mentions bookmarker features underway or to be added.  Contributor Ted noting there is much clean-up work to do in this shell script.  Present outstanding improvements sorted roughly by date of posting include:

- 2025-11-05 WED -

[ ]  Refactor sole main script into three scripts, one yet a main script and the others focused on features:

(1)  bookmark managing script, the primary script
(2)  aliases scripts to support custom aliases in an encapsulated way
(3)  environment vars export script

. . . Implement these in part using the recent gained knowledge on the use of sourcing scripts and then calling their functions.

- 2021-10-08 -
     
[ ]  test script when installed in locations differing from ${HOME}     
     
- 2021-09-24 FRI -

[ ]  add support for paths which contain white space
   . . . explore and as possible use recent observation of behavior of double quotes in variable expansions.

- 2021-08-14 MON -

[ ]  script review and clean up, line by line
     _( this task underway )_

- 2017-12-14 THU -

[ ]  write a separate use and help file for the directory bookmarking script,
     and add alias to show this use file

[ ]  add optional bookmarks group names, at present they're just numbered 1..9

[ ]  add summary report of number of bookmark groups defined, their names, first few entries

A summary comment on directory bookmarker "to do" tasks, there are as of 2021 August four areas of script action which contributor Ted looking to factor into separate shell scripts.  These script actions include:

1.  script help contents and display routine
2.  command aliases, e.g. "alias rm='rm -i'"
3.  given user's ${PATH} amendments
4.  custom environment variable declarations and assignments

In particular tasks or functions 3 and 4 are most particular to given end users, and are not related to the convenience of storing (bookmarking) often visited paths.  Directory bookmarker is not huge, but it has grown over some years and is harder to maintain in a clean, concise fashion.  Such a factoring of environmental configuration tasks could make the bookmarker project easier to use and develop.

## REFERENCES:
For all things shell scripting:
*  https://tldp.org/LDP/abs/html/index.html

Following article describes different behaviors of .bashrc and .bash_profile start up scripts:
*  https://dev.to/awwsmm/setting-up-an-ubuntu-vm-on-windows-server-2g23

Some mark down references:
*  https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf
*  https://towardsdatascience.com/the-ultimate-markdown-cheat-sheet-3d3976b31a0

2021-09-29 - need to review shell aliases and how they may be set globally:
*  https://superuser.com/questions/319538/aliases-in-subshell-child-process
     
     
--- END README.md for directory-bookmarker project ---
