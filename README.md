# dotfiles
Simple config dotfiles for bash, vim, etc

## How to use
1. Go to home directory  
    
    ```shell
    $ cd ~
    ```
    
2. 'Clone' from the repo  

    ```shell
    $ git init  
    $ git remote add origin https://github.com/morcerf/dotfiles.git  
    $ git fetch  
    $ git checkout -t origin/master  `
    ```
    
3. Remove `.git` folder  

    ```shell
    $ rm -r .git
    ```
    
4. Initialize vim and tmux plugins using Vundle and tpm respectively  

    ```shell
    $ vim +PluginInstall +qall
    $ tmux source ~/.tmux.conf
    ```
