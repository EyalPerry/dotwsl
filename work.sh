

function ag_cloud() {
    cd $CODE_ROOT && cd agwa-cloud-components
}

function ag_gg() {
    cd $CODE_ROOT && cd agwa-greengrass-service
}

alias agrw="cr && cd agwa-agronomist-web && start"
export AGWA_SERVICE_LIBRARY_TAG=edge