# System

## load nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## load ssh credentials
eval "$(ssh-agent -s > /dev/null 2>&1)" > /dev/null 2>&1