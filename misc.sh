alias cls="clear && printf '\e[3J'"
alias dotfiles="cd $SCRIPT_ROOT"
alias cr="cd $CODE_ROOT"

function pkill(){
    kill -9 $(lsof -t -i:$1)
}