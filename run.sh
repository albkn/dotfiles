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

ensure_directory() {
    dir_path="$1"
    if [ ! -d "$dir_path" ]
    then
        mkdir -p $dir_path && echo "$dir_path created"
    fi
}

try_link_file() {
    path="$1"
    source_file="`pwd`/$path"
    target_file=~/"$path"

    if [ ! -e "$target_file" ]
    then
        ensure_directory `dirname "$target_file"`
        ln -s "$source_file" "$target_file" && echo "$path linked"
    fi
}

try_unlink_file() {
    path="$1"
    target_file=~/"$path"

    if [ -L "$target_file" ]
    then
        rm "$target_file" && echo "$path unlinked"
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
