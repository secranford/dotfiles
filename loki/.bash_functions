############################################################
# ~/.bash_functions
# This file contains custom bash function definitions.
# It is sourced by your ~/.bashrc for easier maintenance.
#
# To use this file, add the following line to your ~/.bashrc:
#   if [ -f ~/.bash_functions ]; then
#       . ~/.bash_functions
#   fi
############################################################

###############################
# General Utility Functions
###############################

#this function is often in linux systems but not on AEM's, it functions similarly to module. remove if already on system
ml() {
    if [ "$#" -eq 0 ]; then
        # No arguments provided, list loaded modules
        module list
    elif [ "$#" -eq 1 ]; then
        local arg="$1"
        if module list 2>/dev/null | grep -q "$arg"; then
            # Argument matches a loaded module, list it
            module list | grep "$arg"
        elif module avail 2>/dev/null | grep -q "$arg"; then
            # Argument matches an available module, load it
            module load "$arg"
        else
            # Argument does not match a loaded or available module, forward to `module` command
            module "$arg"
        fi
    else
        # Multiple arguments, forward them to `module`
        module "$@"
    fi
}

#this runs tecplot in the background without the output to terminal and lets you pass arguements to tec360
btec() {
    tec360 "$@" > /dev/null 2>&1 &
}

#displays long format of most recent files, pass number to display more than just the most recent
recent_files() {
    local count=${1:-1}  # Default to 1 if no argument is provided
    ls -lAht | head -n "$((count + 1))" | tail -n "$count"
}

watchq() {
  local interval="${1:-3}"   # use $1 if given, otherwise 3
  watch -n "$interval" squeue -u "$USER"
}

mgds_load() {
    loki_cmds=(
        "echo 'MGDS executable still needed'"
        "echo '# --- Loki MGDS Build ---'"
        "export MODULEPATH=/share/apps/Modules"
        "module load MPI/ROME/OpenMPI/4.1.1/GCC/4.8.5"
        "module use --append /project/cranf014/opt/moduleFiles" 
        "module load MK/HDF5/loki/4.0.3/OpenMPI/4.1.1/GCC/4.8.5" 
        "module load MK/ParMETIS/loki/4.0.3/OpenMPI/4.1.1/GCC/4.8.5"
    )

    local_cmds=(
        "echo 'MGDS executable still needed'"
        "echo '# --- Local MGDS Build ---'"
        "module use --append /stage/site/modules/common"
        "module use --append /project/hbj/opt/g/openSUSE-15.0/modules" 
       	"module load Compilers/GCC/7.4.1"
        "module load MPI-HBJ/OpenMPI/3.1.4/GCC/7.4.1"
        "module load hdf5/1.8.21/OpenMPI/3.1.4/GCC/7.4.1"
	"module use --append /project/cranf014/opt/moduleFiles"
	"module load MK/ParMETIS/local/4.0.3/OpenMPI/3.1.4/GCC/7.4.1"
    )

    if [ $# -eq 0 ]; then
        cmds=("${loki_cmds[@]}")
    else
        if [[ "$1" == "-t" && -n "$2" ]]; then
            case "$2" in
                loki) cmds=("${loki_cmds[@]}") ;;
                local) cmds=("${local_cmds[@]}") ;;
                *) echo "Unknown command list: $2"; return 1 ;;
            esac
            #echo "Executing first two commands of $2:"
            for cmd in "${cmds[@]:0:2}"; do
                eval "$cmd"
            done
            #echo "Remaining commands in $2:"
            for cmd in "${cmds[@]:2}"; do
                echo "$cmd"
            done
            return
        else
            case "$1" in
                loki) cmds=("${loki_cmds[@]}") ;;
                local) cmds=("${local_cmds[@]}") ;;
                *) echo "Unknown command list: $1"; return 1 ;;
            esac
        fi
    fi

    for cmd in "${cmds[@]}"; do
        eval "$cmd"
    done
}
###############################
# Command Wrappers
###############################

#these functions replace cp and mv with backup mode cp and mv if i am using an interactive shell, stops system processes from defaulting. --nb means no backup
#***NOTE*** I set the backup suffix in my .bashrc, the default is .bak
cp() {
    if [[ "$1" == "--nb" ]]; then
        shift
        command cp "$@"
    else
        if [ -n "$PS1" ]; then
            command cp -b "$@"
        else
            command cp "$@"
        fi
    fi
}

mv() {
    if [[ "$1" == "--nb" ]]; then
        shift
        command mv "$@"
    else
        if [ -n "$PS1" ]; then
            command mv -b "$@"
        else
            command mv "$@"
        fi
    fi
}

###############################
# Directory Navigation Functions
###############################

proj() {
        cd /project/$USER/$1
}

mloc() {
        cd /project/$USER/local/$1
}

mopt() {
        cd /project/$USER/opt/$1
}

mscr() {
	cd /scratch.nike/$USER/$1
}

mrep() {
    cd /project/$USER/my-repos/$1
}
