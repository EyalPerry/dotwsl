# System

## load nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -d "$HOME/anaconda3" ] ; then
  PATH="$PATH:$HOME/anaconda3/bin"
fi

## load ssh credentials
eval "$(ssh-agent -s > /dev/null 2>&1)" > /dev/null 2>&1