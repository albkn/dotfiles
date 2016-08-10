#!/bin/sh

base_dir=".dotfiles"

try_link_file() {
    path="$1"
    if [ ! -e ~/"$path" ]; then
        ln -s "$base_dir/$path" ~/"$path" && echo "$path linked"
    fi
}

if [ "$1" = "link" ]; then
    try_link_file ".gitconfig"
    try_link_file ".bash_custom"
    try_link_file ".tmux.conf"
    try_link_file ".vimrc"
    try_link_file ".Xresources"
    try_link_file ".Brewfile"
elif [ "$1" = "unlink" ]; then
  test -h ~/.gitconfig && rm ~/.gitconfig
  test -h ~/.bash_custom && rm ~/.bash_custom
  test -h ~/.tmux.conf && rm ~/.tmux.conf
  test -h ~/.vimrc && rm ~/.vimrc
  test -h ~/.Xresources && rm ~/.Xresources
  test -h ~/.Brewfile && rm ~/.Brewfile
fi
