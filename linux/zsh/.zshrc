# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="takashiyoshida"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    autojump
    autopep8
    zsh-autosuggestions
    colorize
    zsh-syntax-highlighting
    zsh-z 
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# zsh syntax highlighting 
# source /home/smallpondtom/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Zsh Autojump 
[[ -s /home/smallpondtom/.autojump/etc/profile.d/autojump.sh  ]] && source /home/smallpondtom/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

## Useful aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gohome='cd /mnt/c/Users/Tomo'


# Startin messages 
#neofetch 
# toilet "Let's Code"

#echo  ' ████████╗ ██████╗ ███╗   ███╗ ██████╗      ██████╗ ██████╗ ██████╗ ███████╗'
#echo  ' ╚══██╔══╝██╔═══██╗████╗ ████║██╔═══██╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝ '
#echo  '    ██║   ██║   ██║██╔████╔██║██║   ██║    ██║     ██║   ██║██║  ██║█████╗  '
#echo  '    ██║   ██║   ██║██║╚██╔╝██║██║   ██║    ██║     ██║   ██║██║  ██║██╔══╝  '
#echo  '    ██║   ╚██████╔╝██║ ╚═╝ ██║╚██████╔╝    ╚██████╗╚██████╔╝██████╔╝███████╗'
#echo  '    ╚═╝    ╚═════╝ ╚═╝     ╚═╝ ╚═════╝      ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝ '

# Node.JS path
# export PATH=/home/smallpondtom/.nvm/versions/node/v15.8.0/bin:$PATH
# export PATH=/home/smallpondtom/.cargo/bin:$PATH

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first --icons' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing

# Set path for GoLang
#export PATH=/usr/local/go/bin $PATH

#source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm settings 
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go path
#export PATH=/usr/local/go/bin:$PATH

# Python path 
# export PATH=/usr/bin/python3.9:$PATH

# Git fix configuration 
#alias 'git clone'='git clone --depth=1'

# JAVA Setup
#export JAVA_HOME='/usr/local/java/jdk1.8.0_291'
#export PATH=$JAVA_HOME/bin:$PATH 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tomoki/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tomoki/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tomoki/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tomoki/anaconda3/bin:$PATH"
    fi
fi
#unset __conda_setup
# <<< conda initialize <<<

# Set vim to nvim
alias vim='nvim'

# ROS2 Config
source ~/ros2_galactic/install/local_setup.zsh
export ROS_DOMAIN_ID=101

# clang
export CC=clang
export CXX=clang++

# Julia
export PATH=/opt/julia-1.6.2/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Github readme generation
alias genreadme='cookiecutter gh:dec0dOS/amazing-github-template'

