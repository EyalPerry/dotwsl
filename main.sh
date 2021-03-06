## set the path where the repo root has been cloned into
export SCRIPT_ROOT=${0:a:h}
export CURRENT_DIR=$(pwd)

source $SCRIPT_ROOT/var.sh

source $SCRIPT_ROOT/work.sh

if [ -f $SCRIPT_ROOT/env.sh ]; then
    source $SCRIPT_ROOT/env.sh
fi

source $SCRIPT_ROOT/framework.sh
source $SCRIPT_ROOT/system.sh
source $SCRIPT_ROOT/misc.sh
source $SCRIPT_ROOT/node.sh
source $SCRIPT_ROOT/git.sh
source $SCRIPT_ROOT/docker.sh
source $SCRIPT_ROOT/python.sh
source $SCRIPT_ROOT/devices.sh

cd $CURRENT_DIR