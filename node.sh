alias del_dep="rm -rf node_modules"
alias ri="del_dep && npm ci"
alias nkill="killall -9 node"
alias start="npm run start"
alias stop="npm run stop"
alias test="npm run test"
alias client="npm run client"

## Installs the specified NPM version
### arg0: npm version
function npm_version() {
  npm install -g npm@$1
}