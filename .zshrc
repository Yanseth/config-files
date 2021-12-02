# First, figure out if we are in linux or Darwin (mac)
# Then set some vars for later
OS=$(uname 2> /dev/null)
if [[ "$OS" = "Darwin" ]]; then
    HOME=/Users/dan.guimaraes
    export ZPLUG_HOME=/usr/local/opt/zplug
elif [[ "$OS" = "Linux" ]]; then
    HOME=/home/danielg
    export ZPLUG_HOME="$HOME"/.zplug
else
    echo "Unknown OS $OS"
    exit 1
fi

# Load zplug
source $ZPLUG_HOME/init.zsh

# Import pulgins
# zplug "eendroroy/alien-minimal"

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
zplug "plugins/sudo", from:oh-my-zsh

# Some coloring helpers
zplug "zpm-zsh/colorize"
zplug "ael-code/zsh-colored-man-pages"
zplug "zsh-users/zsh-syntax-highlighting"

# Some mac specific ones
# plugins=(asdf bundler docker gem git git-auto-fetch kubectl rails rake sudo vscode)
if [[ "$OS" = "Darwin" ]]; then
    zplug "plugins/asdf", from:oh-my-zsh
    zplug "plugins/bundler", from:oh-my-zsh
    zplug "plugins/docker", from:oh-my-zsh
    zplug "plugins/gem", from:oh-my-zsh
    zplug "plugins/git-auto-fetch", from:oh-my-zsh
    zplug "plugins/kubectl", from:oh-my-zsh
    zplug "plugins/rails", from:oh-my-zsh
    zplug "plugins/rake", from:oh-my-zsh
    zplug "plugins/vscode", from:oh-my-zsh
fi

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
    if [[ ${USER} = "root" ]]; then
        HISTFILE=/root/.zhistory
        return 0
    else
        HISTFILE="$HOME"/.zhistory
        return 0
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

# Expand alias after sudo
# alias sudo='sudo '

if [[ "$OS" = "Linux" ]] && [[ -d /ect/s6/ ]] ; then
    # Alias S6 commands for Linux using s6-rc
    if [[ "$USER" = "root" ]]; then
        alias s6rc=s6-rc
        alias s6u='s6-rc -u change'
        alias s6d='s6-rc -d change'
        alias s6r='s6-svc -r'
        alias s6rcb=s6-rc-bundle
        alias s6rcbu=s6-rc-bundle-update
        alias s6rcbc='s6-rc-bundle-update -c'
    else
        alias s6rc='sudo s6-rc'
        alias s6u='sudo s6-rc -u change'
        alias s6d='sudo s6-rc -d change'
        alias s6r='sudo s6-svc -r'
        alias s6rcb='sudo s6-rc-bundle'
        alias s6rcbu='sudo s6-rc-bundle-update'
        alias s6rcbc='sudo s6-rc-bundle-update -c'
    fi
fi

# Use fzf
if [[ "$OS" = "Darwin" ]]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
else
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Brew auto completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
fi

unfunction historyfile

# Some mac specific options
if [[ "$OS" = "Darwin" ]]; then
    # Generated for envman. Do not edit.
    [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
    # Path to nerd fonts in Mac
    export PATH="/Users/dan.guimaraes/.local/bin:$PATH"

    # LS Colors for mac
    export CLICOLOR=1;
    export LSCOLORS=exfxcxdxbxegedabagacad; # It is the default value on OSX, so this line can be omitted
fi

export PATH="/usr/local/sbin:$PATH"
if [[ -f ~/.appfolio_env ]]; then
    source ~/.appfolio_env
fi

# Load asdf
if [[ "$OS" = "Linux" ]]; then
    . /opt/asdf-vm/asdf.sh
fi

# Replace ls with exa if exa is installed, requires cargo
# You will need to sim link exa to asdf's shims dir ~/.asdf/shims/
if command -v exa &> /dev/null; then
    alias ls="exa --color=always --icons -al --group-directories-first --git"
fi

if command -v bat &> /dev/null; then
    alias bat=cat
fi

export PATH=/home/danielg/.local/bin:"$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export CARGO_HOME="$HOME/.asdf/shims/"

eval "$(starship init zsh)"
