alias main="git checkout main && git pull"
alias push="git push"
alias pull="git pull"

alias master_exists="git show-ref --verify --quiet refs/heads/master"
alias main_exists="git show-ref --verify --quiet refs/heads/main"

if master_exists; then
    export DEFAULT_BRANCH="master"
fi

if main_exists; then
    export DEFAULT_BRANCH="main"
fi

function current_branch() {
    git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||'
}

function defsync() {
    git checkout $DEFAULT_BRANCH && git pull
}

function merged() {
    X_CURRENT_GIT_BRANCH=$(current_branch)
    git checkout $DEFAULT_BRANCH && git pull && git branch -D $X_CURRENT_GIT_BRANCH
}

### Stage all and commit with message
### arg0-n: commit message parts
function commit() {
    git add -A && git commit -m "$*"
}

function uncommit() {
    git reset HEAD^1
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
### arg1: name of source branch (defaults to main)
function branch() {
    SRC=${2:-$DEFAULT_BRANCH}
    git checkout $SRC && git pull &&
        git checkout -b $1
}

### publishes the current branch to a remote repository
### arg0: remote repository (defaults to origin)
function publish() {
    REMOTE=${1:-origin}
    X_CURRENT_GIT_BRANCH=$(current_branch)
    git push -u $REMOTE $X_CURRENT_GIT_BRANCH
}

### pulls and merges a source branch into the current branch
### arg0: name of the source branch (defaults to main)
function sync() {
    SRC=${1:-$DEFAULT_BRANCH}
    X_CURRENT_GIT_BRANCH=$(current_branch)
    git checkout $SRC && git pull &&
        git checkout $X_CURRENT_GIT_BRANCH &&
        git merge --no-edit $SRC
}

function ptag() {
    if [ -z $1 ]; then
        echo "no argument supplied"
        exit 1
    fi

    git push --delete origin $1
    git tag -f $1
    git push origin $1
}
