#!/bin/sh

files=(
    '.gitconfig'
    '.bash_custom'
    '.tmux.conf'
    '.vimrc'
    '.Xresources'
    '.Brewfile'
    '.config/nvim/init.vim'
    '.config/nvim/ftplugin/javascript.vim'
    '.config/nvim/ftplugin/json.vim'
)

try_link_file() {
    path="$1"
    if [ ! -e ~/"$path" ]
    then
        ln -s "`pwd`/$path" ~/"$path" && echo "$path linked"
    fi
}

try_unlink_file() {
    path="$1"
    if [ -h ~/"$path" ]
    then
        rm ~/"$path" && echo "$path unlinked"
    fi
}

if [ "$1" = "link" ]; then
    for file in ${files[@]}
    do
        try_link_file "$file"
    done
elif [ "$1" = "unlink" ]; then
    for file in ${files[@]}
    do
        try_unlink_file "$file"
    done
fi
