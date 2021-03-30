# Framework


source $ANTIGEN_PATH


## Load the oh-my-zsh library
antigen use oh-my-zsh

## Load plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle brew
antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle npm
antigen bundle node
antigen bundle osx

## Load theme
source $SCRIPT_ROOT/theme.sh
antigen theme bhilburn/powerlevel9k powerlevel9k

#Apply loaded modules
antigen apply