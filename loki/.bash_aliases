############################################################
# .bash_aliases
# This file contains personal alias definitions.
# It is sourced by ~/.bashrc if present.
#
# To use this file, add the following line to your ~/.bashrc:
#   if [ -f ~/.bash_aliases ]; then
#       . ~/.bash_aliases
#   fi
############################################################

#------------------------------
# General Command Aliases
#------------------------------
alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -lAh" #doesn't list . and .. unlike -a
alias lt="ls -lth"
alias lwc="ls -A1 | wc -l" #counts number of files, including hidden in current dir
alias grep="grep --color"
alias fgrep="fgrep --color"
alias egrep="egrep --color"
alias lg="ls -lAh | grep"        #for use in searching, include pattern after and continue piping as needed
alias sshy="ssh -Y"              #shouldn't default ssh to this
alias pwd='pwd -P'               #ensures full path is always listed, not symlinked one
alias tailR="tail -f RUN.stdout" #shortcut for tail

alias disizes='du -hs * | sort -hr'          #lists the files in the current dir sorted by size big to small. summarizes so no files within dirs listed
alias hiddensizes='du -hs .[^.]* | sort -hr' #similar to above but just shows hidden files and dirs, ie .ssh

# this bwlimit is recommended for our system, probably not needed or a diff number on other systems
alias rsync="rsync --backup --suffix=.backup --bwlimit=50000" #set bandwidth limit on rsync and is in backup mode so things dont accidentally get deleted, might slow things down though
alias rsw="rsync -avuP --bwlimit=50000"                       #syntax: rsw <from> <to>, will copy new files from xxx to yyy ignoring older or up to date files and limiting the bandwidth. WARNING, destination is affected by .bashrc settings, ie, if bashrc for host puts you somewhere automatically, this is already included within the <user>@host path so truncate as needed

#------------------------------
# Navigation Shortcuts
#------------------------------
#I handle much of my navigation shortcuts with bash functions
alias ..="cd .."
alias ...='cd ../..'

#------------------------------
# Custom Commands
#------------------------------
alias myrc="source ~/.bashrc"       #use to source bashrc if pwd not ~, otherwise i use . .bashrc
alias vmyrc="vim ~/.bashrc"         #use to edit bashrc from anywhere
alias valias="vim ~/.bash_aliases"  #use to edit aliases from anywhere
alias vfunc="vim ~/.bash_functions" #use to edit functions from anywhere
alias vvrc="vim ~/.vimrc"           #use to edit vimrc from anywhere

alias sqme="squeue -u $USER"
alias sq="squeue"
alias sq_long="squeue -o '%.18i %.9P %.8j %.8u %.2t %.10M %.6D %.6C %.10R %.20S %.30N'"
alias sinfop="sinfo --partition=NAPLES"
