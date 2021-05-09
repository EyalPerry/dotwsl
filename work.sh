function ag_cloud() {
    cd $CODE_ROOT && cd agwa-cloud-components
}

function ag_gg() {
    cd $CODE_ROOT && cd agwa-greengrass-service
}

function ag_grower() {
    cd $CODE_ROOT && cd agwa-mobile-app/AgwaFarmMobileApp
}

function agrw() {
    webapp agwa-agronomist-web
}

function agpw() {
    webapp agwa-website/client
}

alias aglib="python3 -m pip install git+ssh://git@github.com/agwafarm/agwa-service-library.git@${AGWA_SERVICE_LIBRARY_TAG}#egg=agwa-service-library"

alias grower="ag_grower && react-native run-android"
