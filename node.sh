alias del_dep="rm -rf node_modules"
alias ri="del_dep && npm i"
alias nkill="killall -9 node"
alias start="npm run start"
alias stop="npm run stop"
alias test="npm run test"

function webapp() {
   cd $CODE_ROOT && cd $1
   pkill 3000
   npm run start
}
