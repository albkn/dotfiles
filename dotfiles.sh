#!/bin/sh

base_dir=".dotfiles"

if [ "$1" = "link" ]; then
  test ! -e ~/.gitconfig && ln -s "$base_dir"/.gitconfig ~/.gitconfig && echo '.gitconfig linked'
  test ! -e ~/.bash_custom && ln -s "$base_dir"/.bash_custom ~/.bash_custom && echo '.bash_custom linked'
  test ! -e ~/.tmux.conf && ln -s "$base_dir"/.tmux.conf ~/.tmux.conf && echo '.tmux.conf linked'
  test ! -e ~/.vimrc && ln -s "$base_dir"/.vimrc ~/.vimrc && echo '.vimrc linked'
  test ! -e ~/.Xresources && ln -s "$base_dir"/.Xresources ~/.Xresources && echo '.Xresources linked'
elif [ "$1" = "unlink" ]; then
  test -h ~/.gitconfig && rm ~/.gitconfig
  test -h ~/.bash_custom && rm ~/.bash_custom
  test -h ~/.tmux.conf && rm ~/.tmux.conf
  test -h ~/.vimrc && rm ~/.vimrc
  test -h ~/.Xresources && rm ~/.Xresources
fi
