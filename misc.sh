alias cls="clear && printf '\e[3J'"
alias dotfiles="cd $SCRIPT_ROOT"
alias cr="cd $CODE_ROOT"
alias shconf="code $SCRIPT_ROOT"

# kills the process which is bound to the specified port
# arg0: port of process to kill
function pkill() {
    kill -9 $(lsof -t -i:$1)
}
