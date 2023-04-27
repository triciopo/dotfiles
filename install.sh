#!/bin/bash

DIR=$HOME/dotfiles

declare -A dotfiles=(
  [".bashrc"]="bash/.bashrc"
  [".bash_aliases"]="bash/.bash_aliases"
  [".bash_profile"]="bash/.bash_profile"
  [".tmux.conf"]="tmux/.tmux.conf"
  [".nanorc"]="nano/.nanorc"
  [".config/micro"]="micro"
  [".config/htop"]="htop"
)

# Update and install necessary packages
function packages() {
  if command -v apt &> /dev/null; then
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install -y tmux micro nano htop git golang-go
  elif command -v pacman &> /dev/null; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm tmux micro nano htop git go
  fi

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
        *) echo "Skipping $dotfile" return ;;
      esac
  done
  printf "\nDone!\n"
}

packages
install
