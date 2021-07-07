alias py_env_init="rm -rf .pyenv/env && python3 -m venv --system-site-packages .pyenv/env && py_env_activate"
alias py_env_activate="source ./.pyenv/env/bin/activate"

alias py_test="pytest"
alias pi="pip install -I --no-cache-dir"

function pyp() {
    export TWINE_USERNAME=aws
    export TWINE_PASSWORD=$(aws codeartifact get-authorization-token --domain agwafarm-private --domain-owner 953022346399 --query authorizationToken --output text)
    export TWINE_REPOSITORY_URL=$(aws codeartifact get-repository-endpoint --domain agwafarm-private --domain-owner 953022346399 --repository agwafarm-private --format pypi --query repositoryEndpoint --output text)
    export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token --domain agwafarm-private --domain-owner 953022346399 --query authorizationToken --output text)
    # command does not support non interactive mode, so we give it time to run and finish
    aws codeartifact delete-package-versions --domain agwafarm-private --domain-owner 953022346399 --repository agwafarm-private --format pypi --package $1 --versions $AGWA_SERVICE_LIBRARY_TAG &
    sleep 5
    # aws codeartifact delete-package-versions --domain agwafarm-private --domain-owner 953022346399 --repository agwafarm-private --format pypi --package agwa-analytics --versions edge

    rm -rf dist
    python setup.py sdist
    twine upload --non-interactive dist/*
}

function pyi() {
    py_env_init
    export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token --domain agwafarm-private --domain-owner 953022346399 --query authorizationToken --output text)
    pip config set global.extra-index-url https://aws:$CODEARTIFACT_AUTH_TOKEN@agwafarm-private-953022346399.d.codeartifact.us-west-2.amazonaws.com/pypi/agwafarm-private/simple/
    if [ -f requirements.txt ]; then
        pip3 install --no-cache-dir -I -r requirements.txt
    fi

    if [ -f requirements-dev.txt ]; then
        pip3 install --no-cache-dir -I -r requirements-dev.txt
    fi

    if [ -f test/requirements.txt ]; then
        pip3 install --no-cache-dir -I -r test/requirements.txt
    fi

    if [ -d src/functions ]; then
        for d in src/functions/*/; do
            if [ -f "$d"/requirements.txt ]; then
                pip3 install --no-cache-dir -I -r "$d"/requirements.txt
            fi
            if [ -f "$d"/requirements-dev.txt ]; then
                pip3 install --no-cache-dir -I -r "$d"/requirements-dev.txt
            fi
        done
    fi

    if [ -d src/lambdas ]; then
        for d in src/lambdas/*/; do
            if [ -f "$d"/requirements.txt ]; then
                pip3 install -I --no-cache-dir -r "$d"/requirements.txt
            fi
            if [ -f "$d"/requirements-dev.txt ]; then
                pip3 install -I --no-cache-dir -r "$d"/requirements-dev.txt
            fi
        done
    fi

    py_monorepo_install
}

function py_monorepo_install() {
    export CI_MODE="true"
    IFS=$'\n'
    set -f
    libraries_list=($(find . -maxdepth 1 -type d))
    export CURRENT_DIR=$(pwd)
    for d in $libraries_list; do
        cd $CURRENT_DIR
        if [ -f "$d/setup.py" ]; then
            cd $d
            pip3 install -I --no-cache-dir -e '.[dev]'
        fi
    done
    cd $CURRENT_DIR
}

if [ -f ./.pyenv/env/bin/activate ]; then
    py_env_activate
fi
