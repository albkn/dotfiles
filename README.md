# dotfiles
Simple config dotfiles for bash, vim, etc

## How to use
1. Go to home directory  
    
    ```shell
    $ cd ~
    ```
    
2. Clone from the repo to `.dotfiles` diretory  

    ```shell
    $ git clone https://github.com/morcerf/dotfiles .dotfiles
    ```
    
3. Go into the directory and run the script

    ```shell
    $ cd ~/.dotfiles
    $ ./dotfiles.sh
    ```
    
4. Initialize vim and tmux plugins using Vundle and tpm respectively  

    ```shell
    $ vim +PluginInstall +qall
    $ tmux source ~/.tmux.conf
    ```
