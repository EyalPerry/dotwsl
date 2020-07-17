# What is this
macOS zsh configuration for InVision DSM Developers

# Dependencies
Make sure you have the below installed / configured properly before using this repo.

- iTerm2
- homebrew
- nvm
- zsh
- antigen (an awesome dependency manager for zsh / oh-my-zsh)
- npm i -g yalc@1.0.0-pre.27
- brew tap mongodb/brew && brew install mongodb-community-shell  
- nvm install 10.16.3
- npm install -g npm@6.4.1
- nerdfonts (the powerline font of choice for many devs) - or any other powerline font you like.
- invision-local
  
# Setup

1) clone this repo into `~/dotdsm` <br/>

2) (important!) change variables in `var.sh` according to your folder layout and other preferences.<br/>

3) (optional) Add an `env.sh` file in this repository's root and export credentials and any other variables <br/>
This file will not be committed into source control.<br/>

```bash
export AWS_ACCESS_KEY_ID=?
export AWS_SECRET_ACCESS_KEY=?
export USER_NAMESPACE=?
export SNYK_TOKEN=?
```

4) (optional) apply the `iterm-profile.json` to your iTerm. <br/>
If you skip this step, be sure to apply your powerline font of choice to your terminal.<br/>

5) (optional) copy `docker-compose.override.yml` to invision-local folder.

6) (important) Add the below line into `~/.zshrc`: <br/>

```bash
source ~/dotdsm/main.sh
```

# Automation
These scripts automatically do the below:
- Load your SSH Credentials
- Load NVM and apply the correct node and npm versions used by the DSM team

# Notable commands
Look in `productivity.sh` and `in-*.sh` for more. 

## shconf
Opens this project's folder in your editor of choice, enabling you to make changes to these very scripts

## dsmls
Logs the status of DSM docker containers

## logs_* (i.e. logs_api)
Renders the logs outputted by a service

## dsm_env
Starts the environment needed for DSM to be developed locally.

## dsm_api / dsm_web / dsm_lib / dsm_shared
cd into the specified project. see `in-paths.sh` for more.

## dsm_env_update
Updates invision-local and invokes dsm_env

## dsm_override
overrides invision-local services to be served from the local repositories.

## sketch_dev
open sketch and run the sketch plugin dev server in two separate iTerm tabs.<br/>
authenticate against the local environment in v6 / v7 modes.
see command for specific options

## webstorm
opens WebStorm (optional argument- path to open in WebStorm, defaults to current folder)

## vscode
opens VS Code (optional argument- path to open in VS Code, defaults to current folder)
