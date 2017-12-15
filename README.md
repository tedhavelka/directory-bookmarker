# --- START README.md for directory-bookmarker project ---

## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Open source directory bookmarker by Ted Havelka
## - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


Supported Environments:

 Works in Unix and Linux shell environments, typically installed in
 given user's home directory.  Won't automatically run by its presence
 alone, but easy to activate automatically at login by sourcing this
 script from a standard shell login script such as .bashrc.



Basic use:

*  's'           to show bookmarked full paths to directories,
*  'sd1'         to set bookmark 1 of 30 or so,
*  'sdn'         to set bookmark n of 30 or so, where n is a positive integer
*  'gd1'         to change working directory to first bookmarked path
*  'gdn'         to change working directory to first bookmarked path
*  'sp'          to save bookmarked paths in present shell to text file

*  'lp1'         to load paths (bookmarked paths) group 1 out of groups 1..9
*  'clearpaths'  alias to clear bookmarked paths in present shell session / environment



Features underway or to be added:

- 2017-12-02 SAT -

Bookmarker contributor Ted noting there is much clean-up work to do in this shell script.  Ted working to:

[ ]  factor command aliasing, path variable amendments into shell routines
   [x]  command aliasing is factored into a couple of shell routines

[x]  add support for multiple directory bookmark sets


- 2017-12-14 THU -

[ ]  write a separate use and help file for the directory bookmarking script,
     and add alias to show this use file

[ ]  add summary report of number of bookmark groups defined, their names, first few entries

[ ]  add optional bookmarks group names, at present they're just numbered 1..9



# --- END README.md for directory-bookmarker project ---
