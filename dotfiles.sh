#!/bin/sh

base_dir=".dotfiles"

if [ "$1" = "link" ]; then
  ln -s "$base_dir"/.gitconfig ~/.gitconfig
  ln -s "$base_dir"/.bash_custom ~/.bash_custom
  ln -s "$base_dir"/.tmux.conf ~/.tmux.conf
  ln -s "$base_dir"/.vimrc ~/.vimrc
  ln -s "$base_dir"/.Xresources ~/.Xresources
elif [ "$1" = "unlink" ]; then
  test -h ~/.gitconfig && rm ~/.gitconfig
  test -h ~/.bash_custom && rm ~/.bash_custom
  test -h ~/.tmux.conf && rm ~/.tmux.conf
  test -h ~/.vimrc && rm ~/.vimrc
  test -h ~/.Xresources && rm ~/.Xresources
fi
