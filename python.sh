alias py_env_i="rm -rf .pyenv/env && python3 -m venv .pyenv/env"
alias py_env="source ./.pyenv/env/bin/activate"
alias py_i="py_env && pip3 install -e '.[dev]'"
alias py_test="py_env && pytest"