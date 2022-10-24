#!/bin/bash
#  ___    __                       _______       __               
# |   |  |__.-----.--.--.--.--.   |   _   .-----|  |_.--.--.-----.
# |.  |  |  |     |  |  |_   _|   |   1___|  -__|   _|  |  |  _  |
# |.  |__|__|__|__|_____|__.__|   |____   |_____|____|_____|   __|
# |:  1   |                       |:  1   |                |__|   
# |::.. . |                       |::.. . |                       
# `-------'                       `-------'
#####################################################################################
# This is a shell file that does a complete setup for a newly installed Ubuntu Linux 
# Author: Tomoki Koike
# contact: tkoike45@outlook.com
# Last Edited: 09-05-2022

############################
# Prerequisites
############################

# (1) Create a new ssh key and manually add it your github account
# (2) Check the version of your Ubuntu and compatability with any of the stuff below
# (3) Prepare yourself mentally

# First take in the sudo user password as the command line input 
SUDOPW = $1

############################
# Step 0
# Preliminaries
############################

# Move to home directory just in case
cd $HOME

# Make downloads folder for further use
mkdir Downloads

# Update and upgrade 
echo $SUDOPW | sudo -S apt update  # only the first sudo command requires password
sudo apt upgrade -y

# Install some homekeeping packages
sudo apt-get install vim git build-essential make zsh curl gcc g++ apt-transport-https gnupg2 -y

# Clone my configurations repo
# mkdir $HOME/.config
# cd $HOME/.config
# git clone git@github.com:smallpondtom/myConfigs.git
# cd $HOME

############################
# Step 1
# ZSH
############################
echo "Setting up zsh ...\n"
# Install ohmyzsh and make zsh default 
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins 
## Colorize - chroma
sudo apt-get install chroma -y

## FzF
sudo apt-get install fzf -y

## Zsh Auto-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Zsh Syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

## Zsh-z
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

## Add new lines to zshrc
sed -i.bak 's/plugins=(git)/plugins=(\n  colorize\n  fzf\n  git\n  gitignore\n  pyenv\n  zsh-autosuggestions\n  zsh-syntax-hightlighting\n  zsh-z\n)/' $HOME/.zshrc

printf "\n" >> $HOME/.zshrc
printf "# Add .local bin to PATH\n" >> $HOME/.zshrc
printf "export PATH=$HOME/.local/bin:$PATH\n" >> $HOME/.zshrc

printf "\n" >> $HOME/.zshrc
printf "# Settings for zsh fzf\n" >> $HOME/.zshrc
printf "FZF_BASE=/usr/bin/fzf\n" >> $HOME/.zshrc

printf "\n" >> $HOME/.zshrc
printf "# Autojump Settings\n" >> $HOME/.zshrc
printf "[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh \n" >> $HOME/.zshrc
printf "autoload -U compinit && compinit -u" >> $HOME/.zshrc

printf "## Useful aliases\n" >> $HOME/.zshrc
printf "alias ..='cd ..'\n" >> $HOME/.zshrc
printf "alias ...='cd ../..'\n" >> $HOME/.zshrc
printf "alias ....='cd ../../..'\n" >> $HOME/.zshrc
printf "alias .....='cd ../../../..'\n" >> $HOME/.zshrc
printf "alias ......='cd ../../../../..'\n" >> $HOME/.zshrc
printf "alias dir='dir --color=auto'\n" >> $HOME/.zshrc
printf "alias vdir='vdir --color=auto'\n" >> $HOME/.zshrc
printf "alias grep='grep --color=auto'\n" >> $HOME/.zshrc
printf "alias fgrep='fgrep --color=auto'\n" >> $HOME/.zshrc
printf "alias egrep='egrep --color=auto'\n" >> $HOME/.zshrc
printf "alias windows='cd /mnt/c/Users/Tomo'\n" >> $HOME/.zshrc

# Install rust and rustc with rustup
sudo apt-get update && sudo apt-get upgrade -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
printf "\n" >> $HOME/.zshrc
printf "# RUST PATH\n" >> $HOME/.zshrc
printf "source $HOME/.cargo/env\n" >> $HOME/.zshrc

# Install exa
source $HOME/.zshrc
cargo install exa

# Replace ls commands with modern exa
alias ls='exa -al --color=always --group-directories-first --icons' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing

echo "DONE.\n"

############################
# Step 2
# TMUX
############################
echo "Setting up tmux ...\n"
echo $SUDOPW | sudo -s apt-get install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm  # tpm
cp -f $HOME/.config/myConfigs/WSL/ubuntu22.04/tmux/.tmux.conf .
echo "DONE.\n"


############################
# Step 3
# OTHER PROGRAMMING LANGS
############################

# Go
echo "Installing Go ...\n"
cd $HOME/Downloads
rm -rf go*.linux-amd64.tar.gz
wget https://go.dev/dl/$(curl 'https://go.dev/VERSION?m=text').linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go*.linux-amd64.tar.gz
echo "DONE.\n"

# Julia 
echo "Installing Julia ...\n"
sudo apt-get update && sudo apt-get upgrade -y
cd $HOME/Downloads
rm -rf julia*.tar.gz
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.2-linux-x86_64.tar.gz
tar -xvzf julia*.gz
rm -f julia*-linux*.tar.gz
sudo mv julia*/ /opt/
sudo ln -s /opt/julia-*/bin/julia /usr/local/bin/julia
echo "DONE.\n"

# Haskell with ghcup 
echo "Installing Haskell ...\n"
cd $HOME
sudo apt-get update -y
sudo apt install -y build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_GHC_VERSION=latest BOOTSTRAP_HASKELL_CABAL_VERSION=latest BOOTSTRAP_HASKELL_INSTALL_STACK=1 BOOTSTRAP_HASKELL_INSTALL_HLS=1 BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh
echo "DONE.\n"

# Node and Npm with NVM
echo "Installing node and npm ...\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source $HOME/.zshrc
command -v nvm
nvm install --lts
echo "DONE.\n"

############################
# Step 4
# NEOVIM
############################
echo "Setting up neovim ...\n"
cd $HOME
source .zshrc
echo $SUDOPW | sudo -S apt-get update -y
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
cd Downloads
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo apt-get install python3-pip
echo "DONE.\n"
