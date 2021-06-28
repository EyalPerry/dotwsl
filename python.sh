alias py_env_init="rm -rf .pyenv/env && python3 -m venv --system-site-packages .pyenv/env && py_env_activate"
alias py_env_activate="source ./.pyenv/env/bin/activate"

alias py_test="pytest"

function pyi() {
    py_env_init
    export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token --domain agwafarm-private --domain-owner 953022346399 --query authorizationToken --output text)
    pip config set global.extra-index-url https://aws:$CODEARTIFACT_AUTH_TOKEN@agwafarm-private-953022346399.d.codeartifact.us-west-2.amazonaws.com/pypi/agwafarm-private/simple/
    if [ -f requirements.txt ]; then
        pip3 install -I -r requirements.txt
    fi

    if [ -f requirements-dev.txt ]; then
        pip3 install -I -r requirements-dev.txt
    fi

    if [ -f test/requirements.txt ]; then
        pip3 install -I -r test/requirements.txt
    fi

    if [ -d src/functions ]; then
        for d in src/functions/*/; do
            if [ -f "$d"/requirements.txt ]; then
                pip3 install -I -r "$d"/requirements.txt
            fi
            if [ -f "$d"/requirements-dev.txt ]; then
                pip3 install -I -r "$d"/requirements-dev.txt
            fi
        done
    fi

    if [ -d src/lambdas ]; then
        for d in src/lambdas/*/; do
            if [ -f "$d"/requirements.txt ]; then
                pip3 install -I -r "$d"/requirements.txt
            fi
            if [ -f "$d"/requirements-dev.txt ]; then
                pip3 install -I -r "$d"/requirements-dev.txt
            fi
        done
    fi

    # Install monorepo libraries
    if [ -f setup.py ]; then
        pip3 install -e '.[dev]'
    fi

    libraries=$(find . -maxdepth 1 -type d)
    for d in $libraries; do
        if [ -f "$d"/setup.py ]; then
            pip3 install -e '.[dev]'
        fi
    done
}

if [ -f ./.pyenv/env/bin/activate ]; then
    py_env_activate
fi
