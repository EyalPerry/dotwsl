# What is this
zsh configuration for WSL

# Dependencies
Make sure you have the below installed / configured properly before using this repo.

- Windows Terminal
- git
- docker
- nvm
- zsh
- antigen (an awesome dependency manager for zsh / oh-my-zsh)  

# Setup

1) clone this repo into `~/dotfiles` <br/>

2) (important!) change variables in `var.sh` according to your folder layout and other preferences.<br/>

3) (optional) Add an `env.sh` file in this repository's root and export credentials and any other variables <br/>
This file will not be committed into source control.<br/>

```bash
export VARIABLE=?
...
```

4) (optional) apply the `iterm-profile.json` / `windows-terminal-profile.json` to your terminal. <br/>
If you skip this step, be sure to apply your powerline font of choice to your terminal.<br/>

5) (optional) Install the Sauce Code Pro Fonts

6) (important) Add the below line into `~/.zshrc`: <br/>

```bash
source ~/dotfiles/main.sh
```

# Automation
These scripts automatically do the below:
- Load your SSH Credentials
- Load NVM