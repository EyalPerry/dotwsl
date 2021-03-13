export DEFAULT_BRANCH=master

function ag_cloud() {
    cd $CODE_ROOT && cd agwa-cloud-components
}

function ag_gg() {
    cd $CODE_ROOT && cd agwa-greengrass-service
}

alias master="git checkout master && git pull"
alias cdk="node_modules/.bin/cdk"