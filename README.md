# Bash Based Directory Bookmarker

## OVERVIEW:
Directory bookmarking utility written in bash.  Useful for work situations where multiple directories need be accessed and visited often from the command line.

## Install notes (in progress)

This shell utility installs on a per user basis within a user's home directory.  There is no system or other global installation element.

To enable the bookmarking functions automatically on login, a user must amend their .bashrc or similar shell start up file to call `${HOME}/path-to/dbm.sh`.

## REFERENCES:
A long standing and in depth guide to Bash and `sh` shell scripting, by Mendel Cooper et al:
*  https://tldp.org/LDP/abs/html/index.html

Following article describes different behaviors of .bashrc and .bash_profile start up scripts:
*  https://dev.to/awwsmm/setting-up-an-ubuntu-vm-on-windows-server-2g23

Some mark down references:
*  https://guides.github.com/pdfs/markdown-cheatsheet-online.pdf
*  https://towardsdatascience.com/the-ultimate-markdown-cheat-sheet-3d3976b31a0

2021-09-29 - need to review shell aliases and how they may be set globally:
*  https://superuser.com/questions/319538/aliases-in-subshell-child-process
