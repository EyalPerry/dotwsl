alias py_env_init="rm -rf .pyenv/env && python3 -m venv .pyenv/env && py_env_activate"
alias py_env_activate="source ./.pyenv/env/bin/activate"

alias py_test="pytest"

function pyi() {
    if [ -f setup.py ]; then
        pip3 install -e '.[dev]'
    fi

    if [ -f requirements.txt ]; then
        pip3 install -I -r requirements.txt
    fi

    if [ -f requirements-dev.txt ]; then
        pip3 install -I -r requirements-dev.txt
    fi

    if [ -d src/functions]; then
        for d in src/functions/*/; do
            if [ -f "$d"/requirements.txt ]; then
                pip3 install -I -r "$d"/requirements.txt
            fi
            if [ -f "$d"/requirements-dev.txt ]; then
                pip3 install -I -r "$d"/requirements-dev.txt
            fi
        done
    fi

}

if [ -f ./.pyenv/env/bin/activate ]; then
    py_env_activate
fi
