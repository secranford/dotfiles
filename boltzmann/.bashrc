#
##################################################################
#
#	.bashrc file
#
#	Not Read in for login bash shells
#	Read in for subsequent bash shells.
#
##################################################################

if [ -f "/etc/Bashrc" ]; then
	source "/etc/Bashrc"
fi

# Add your stuff below this line
# SEAN CRANFORD
#NOTE: your directory probably isn't called project on your system, change this to the approriate path. Similarly, if .bashrc is not used change corresponding references. Originally I had everything in one bashrc, this is very disorganized. I have started utilizing different dot files to store things like aliases and functions and then load them here. .dircolors, .bash_aliases, and .bash_functions define other settings.

##custom display for environments, called below in PS1 export, \e[1;38;2;135;0;215m is for the shade of purple i want and for it to be bold
#__my_custom_env_display() {
#    if [[ "$CONDA_DEFAULT_ENV" == "base" ]]; then
#        echo -e "\e[1;38;2;135;0;215m(conda)\e[0m"
##    elif [[ -n "$CONDA_DEFAULT_ENV" ]]; then
##        echo -e "\e[1;38;2;135;0;215m($CONDA_DEFAULT_ENV)\e[0m"
##    elif [[ -n "$VIRTUAL_ENV" ]]; then
##        echo -e "\e[1;38;2;135;0;215m($(basename "$VIRTUAL_ENV"))\e[0m"
##    elif [[ -n "$MY_ENV" ]]; then
##        echo -e "\e[1;38;2;135;0;215m($MY_ENV)\e[0m"
#    fi
#}

#=====================System Setup=================================
umask 066 #sets default directory permissions to read-write-execute for user and execute for group/others. new files have read-write permissions for user and none for group/others.
#umask 022 #sets default permissions to be read-write for user, and read permissions for everybody else for files. For directories, this is read-write-execute for user and read-execute for groups/others. This is good for cluster so that if want to give permissions to a specific file, people can navigate your directories.
module use --append /project/$USER/opt/moduleFiles # uses any custom modules you have set up
#module use --append /project/heinz194/opt/moduleFiles # JP's modules, for reference or use

export PATH="/project/$USER/local/bin:/project/$USER/local/scripts:$PATH" #have custom installs or codes located in local/bin searched for before any on the system path and have scripts in local/scripts to run from anywhere. Should use modules instead but this could be good mainly for custom projects that are compiled and ready.

stty erase "^?" #binds backspace key to ^? so it is usable, some systems default to ctrl+h only and this corrects
#export LS_COLORS='di=94' #uses ansi bright blue instead of default ansi blue, 34. USE .dircolor instead!
eval $(dircolors ~/.dircolors) #evaluates colorsettings in .dircolors. this was generated through dircolors -p > ~/.dircolors

cd /project/$USER #open shell in project directory to limit accidental disk usage on local machine
#cd /scratch.nike/$USER #open shell in scratch directory for ease
export PROJ=/project/$USER                        #creates enviro variable to be refrenced for my project directory
export LOCAL=/project/$USER/local                 #creates enviro variable for local dir
export LOCAL_CODES=$LOCAL/codes                   #env variable for codes dir
export LOCAL_SCRIPTS=$LOCAL/scripts               #env variable for scripts dir
export MY_PLUGINS=$LOCAL_CODES/us3d-files/plugins #creates env variable for us3d plugins loc
export OPT=/project/$USER/opt                     #creates enviro variable for opt dir
#export MSCR=/scratch.nike/$USER #creates enviro variable for scratch
export COMMON=/g/a-candl-hbj/COMMON  #enviro variable for common dir
export SCHW=/g/enet-ar-schwart/$USER #enviro variable for ar-schwart dir
export REPO=/project/$USER/my-repos  #env variable for git repo location
#export CONDA_CHANGEPS1=false #keeps conda from changing my prompt
export SIMPLE_BACKUP_SUFFIX=".backup"

# explaination for following command
# set up command prompt to be easy-to-read
# Follows the following pattern:
# blank line
# [Current directory, bold and in green]
# user_name@machine_name:

export PS1="\e[1;32m[\$PWD]\e[0m"$'\n'"\u@\H: "
#export PS1="\e[1;32m[\$PWD]\e[0m"$'\n'"\e[1;31m\u@\H:\e[0m " # changes hostname to red, useful for remote machines
#    \n: Inserts a newline character, so your prompt starts on a new line.
#    \e[1;34m: Changes the text color to bold green. The sequence \e begins an escape sequence, and [1;34m sets the color (1 for bold, 32 for green).
#    [\$PWD]: Displays the current working directory (the full path).
#    \e[0m: Resets the text formatting back to the default terminal color and style.
#    \u: Displays your current username.
#    @\H: Displays the hostname of the machine.
#    : : Adds a colon followed by a space to the end of the prompt.
# set up autocomplete functions to be easier to use (more like c-shell)
bind 'set completion-ignore-case on' #This command makes Bash's tab-completion case-insensitive. For example, typing cd desk and pressing tab will also match Desktop, even if the case doesn't match exactly.
bind 'set show-all-if-ambiguous on'  #When you type a partial command or filename and press tab, and there are multiple possible completions, this option will immediately show all possible completions without requiring a second tab press. For example instead of tab stopping at D, it will display Desktop Downloads Documents.
#bind 'set menu-complete-display-prefix on' #When you start typing and press tab, it will complete the prefix you've typed, and if you press tab again, it will cycle through the possible completions. Essentially, keep hitting tab to go to next option.
#bind '"\t": complete' #This binds the tab key (\t) to trigger the completion function. It explicitly sets tab to be the key you use for auto-completion. Typically just as a precaution
#bind '"\C-i": complete' #This binds Ctrl-i (which is also interpreted as the tab key in many terminals) to trigger the completion function. It's another way of ensuring that pressing tab triggers completion.
#shopt -u progcomp #REMOVE IF NEEDED This disables programmable completion features. Programmable completion is a feature in Bash that allows for more advanced, context-sensitive completions, but disabling it makes the completion simpler and more like csh.
complete -d cd #This sets up a completion rule that only completes directory names when using the cd command. So when you type cd and press tab, only directories will be suggested, not files.

#=====================Modules and env==============================
if [ -n "$PS1" ]; then               #checks that shell is interactive before loading modules
	module load tecplot >/dev/null 2>&1 #loads module without displaying output

fi

#==================User-Specific Aliases and Functions=============
if [ -f ~/.bash_aliases ]; then #define aliases in this file and load here
	. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then #define functions in this file and load here
	. ~/.bash_functions
fi

# if you are in my lab and want access to this, change $USER to my name
if [ -f /project/$USER/local/codes/us3d-files/module-info/.us3d_load ]; then # access to us3d module loading function
	. /project/$USER/local/codes/us3d-files/module-info/.us3d_load
fi
