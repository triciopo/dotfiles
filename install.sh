#!/bin/bash

DIR=$HOME/dotfiles

declare -A dotfiles=(
  [".bashrc"]="bash/.bashrc"
  [".bash_aliases"]="bash/.bash_aliases"
  [".tmux.conf"]="tmux/.tmux.conf"
  [".nanorc"]="nano/.nanorc"
  [".config/micro"]="micro"
  [".config/htop"]="htop"
)

# Update and install necessary packages
function packages() {
  sudo apt update -y && sudo apt upgrade -y
  sudo apt install -y \
       tmux \
       micro \
       nano \
       htop \
       git \
       golang-go

  # Install powerline
  go install github.com/justjanne/powerline-go@latest

  # Get dotfiles
  rm -rf "$DIR"
  git clone https://github.com/triciopo/dotfiles.git "$DIR"
  mkdir -p "$HOME"/.config
}

# Install dotfiles
function install() {
  for dotfile in "${!dotfiles[@]}"; do
    read -rp "Install $dotfile? [Y/N] " opt
      case $opt in
        "Y"|"y")
          rm -rf "$HOME/${dotfile:?}"
	        ln -s "$DIR/${dotfiles[$dotfile]}" "$HOME/$dotfile"
	        ;;
        *) : return ;;
      esac
  done
  printf "\nDone!\n"
}

packages
install
