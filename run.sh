#!/bin/sh

source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

files=(
    '.gitconfig'
    '.bash_custom'
    '.bash_profile'
    '.bashrc'
    '.tmux.conf'
    '.vimrc'
    '.Xresources'
    '.Brewfile'
    '.config/nvim/init.vim'
    '.config/nvim/ftplugin/javascript.vim'
    '.config/nvim/ftplugin/typescript.vim'
    '.config/nvim/ftplugin/json.vim'
    '.config/phpmd/rules.xml'
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
    source_file="$source_dir/$path"
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
