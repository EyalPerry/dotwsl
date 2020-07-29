## Misc
alias cls="clear && printf '\e[3J'"
alias dotfiles="cd $SCRIPT_ROOT"
alias cr="cd $CODE_ROOT"

## Docker
alias dstart="docker-compose up -t 0 --remove-orphans --force-recreate"
alias dstop="docker-compose down -t 0 --remove-orphans"
alias dkill="docker rm -f \$(docker ps -a -q)"
alias dlog="docker-compose logs -f"
alias dlogd="docker-compose logs"

## Node & NPM
alias del_dep="rm -rf node_modules"
alias ri="del_dep && npm i"
alias rci="del_dep && npm ci"
alias nkill="killall -9 node"
alias start="npm run start"
alias stop="npm run stop"
alias test="npm run test"
alias testw="npm run test:watch"

## Installs the specified NPM version
### arg0: npm version
function npm_version() {
  npm install -g npm@$1
}

## Git
alias master="git checkout master && git pull"
alias push="git push"
alias pull="git pull"

### Stage all and commit with message
### arg0-n: commit message parts
function commit() { 
    git add -A && git commit -m "$*"
}

### sets a remote url for the repository
### arg0: remote url
### arg1: remote name (defaults to origin)
function set_remote() {
    REMOTE=${2:-origin} 
    git remote set-url $REMOTE $1
}

### creates a local branch from a source branch after pulling it.
### arg0: name of branch to create
### arg1: name of source branch (defaults to master)
function branch(){
   SRC=${2:-master} 
   git checkout $SRC && git pull \
   && git checkout -b $1 
}

### publishes the current branch to a remote repository
### arg0: remote repository (defaults to origin)
function publish(){
   REMOTE=${1:-origin}
   X_CURRENT_GIT_BRANCH=$(current_branch)
   git push -u $REMOTE $X_CURRENT_GIT_BRANCH
}

### pulls and merges a source branch into the current branch
### arg0: name of the source branch (defaults to master)
function sync(){
    SRC=${1:-master} 
    X_CURRENT_GIT_BRANCH=$(current_branch)
    git checkout $SRC && git pull \
    && git checkout $X_CURRENT_GIT_BRANCH \
    && git merge --no-edit $SRC
}
