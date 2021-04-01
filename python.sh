alias py_env_init="rm -rf .pyenv/env && python3 -m venv .pyenv/env"
alias py_env_activate="source ./.pyenv/env/bin/activate"

alias py_test="pytest"

function pyi(){
   pip3 install -I -r requirements.txt
   for d in src/functions/*/ ; do
   pip3 install -I -r "$d"/requirements.txt
   done
}

if [ -f ./.pyenv/env/bin/activate ]; then
    py_env_activate
fi