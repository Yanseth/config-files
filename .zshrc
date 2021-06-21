# Set up needed vars
HISTFILE=''

# First load zplug
source /home/danielg/.zplug/init.zsh

# Import pulgins
zplug "eendroroy/alien-minimal"

# Git addons
zplug "davidde/git"

# Alias Tips (reminds you of aliases)
zplug sei40kr/fast-alias-tips-bin, from:gh-r, as:command, rename-to:def-matcher
zplug "sei40kr/zsh-fast-alias-tips"

# Auto pipenv shell
zplug "tjquillan/zsh-pipenv"

# Upgrade pyenv with 'pyenv update'
zplug "mattberther/zsh-pyenv"

# Prepend sudo to prvious command in vi mode
zplug "hcgraf/zsh-sudo"

# Some coloring helpers
zplug "zpm-zsh/colorize"
zplug "ael-code/zsh-colored-man-pages"
zplug "Kallahan23/zsh-colorls"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load zplug plugins
zplug load --verbose

# Vi Mode
bindkey -v

function historyfile()
{
    if [[ ${USER} = "danielg" ]]; then
        HISTFILE=/home/danielg/.zhistory
        return 0
    elif [[ ${USER} = "root" ]]; then
        HISTFILE=/root/.zhistory
        return 0
    else
        return 1
    fi
}

### HISTORY SETTINGS ######
# Set HistFile
historyfile
SAVEHIST=10000
HISTSIZE=15000
# immediate append to hist
setopt INC_APPEND_HISTORY_TIME
# Add timestamp to history
setopt EXTENDED_HISTORY
# History DeDup
setopt HIST_IGNORE_ALL_DUPS

# Use powerline
USE_POWERLINE="true"

# Use LS Colors
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  
alias ls='ls --color=auto'

# Use fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

unfunction historyfile

