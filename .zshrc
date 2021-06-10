# First load zplug
source ~/.zplug/init.zsh

# Import pulgins
zplug "eendroroy/alien"  # alien theme

# Git addons
zplug "davidde/git"

# Alias Tips (reminds you of aliases)
zplug sei40kr/fast-alias-tips-bin, from:gh-r, as:command, rename-to:def-matcher
zplug "sei40kr/zsh-fast-alias-tips"

# Auto pipenv shell
zplug "tjquillan/zsh-pipenv"

# Upgrade pyenv with 'pyenv update'
zplug "mattberther/zsh-pyenv"

# Better vi mode
# zplug "jeffreytse/zsh-vi-mode"

# Prepend sudo to prvious command in vi mode
zplug "hcgraf/zsh-sudo"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load zplug plugins
zplug load --verbose

#### Config Theme #####
export ALIEN_SECTIONS_LEFT=(
  exit
  battery
  user
  path
  vcs_branch:async
  vcs_status:async
  vcs_dirty:async
  newline
  ssh
  venv
  prompt
)
export ALIEN_THEME="green"
export ALIEN_USE_NERD_FONT=1

# Load Theme
source ~/.zplug/repos/eendroroy/alien/alien.zsh

### HISTORY SETTINGS ######
# Set HistFile
HISTFILE=/home/danielg/.zhistory
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

# Vi Mode
bindkey -v

# Aliases
alias ls=colorls
alias la='colorls -lah'

# Use fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

