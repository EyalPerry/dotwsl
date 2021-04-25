function ag_cloud() {
    cd $CODE_ROOT && cd agwa-cloud-components
}

function ag_gg() {
    cd $CODE_ROOT && cd agwa-greengrass-service
}

alias agrw="cr && cd agwa-agronomist-web && nkill && start"
alias agpw="cr && cd agwa-website/client && nkill && start"

export AGWA_SERVICE_LIBRARY_TAG=edge
alias aglib="python3 -m pip install git+ssh://git@github.com/agwafarm/agwa-service-library.git@${AGWA_SERVICE_LIBRARY_TAG}#egg=agwa-service-library"
