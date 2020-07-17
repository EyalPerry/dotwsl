## set the path where the repo root has been cloned into
export SCRIPT_ROOT=${0:a:h}
export CURRENT_DIR=$(pwd)

source $SCRIPT_ROOT/var.sh

if [ -f $SCRIPT_ROOT/env.sh ]; then
    source $SCRIPT_ROOT/env.sh
fi

source $SCRIPT_ROOT/framework.sh
source $SCRIPT_ROOT/system.sh
source $SCRIPT_ROOT/productivity.sh

cd $CURRENT_DIR