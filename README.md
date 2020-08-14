# What is this
zsh configuration for WSL

# Dependencies
Make sure you have the below installed / configured properly before using this repo.

- Windows Terminal
- WSL
- git
- docker+WSL2
- nvm
- zsh
- antigen (an awesome dependency manager for zsh / oh-my-zsh)  

# Setup

1) Clone this repo into `~/dotfiles` <br/>

2) Change variables in `var.sh`.<br/>


3) Add an `env.sh` file in this repository's root and export credentials and any other variables <br/>
This file will not be committed into source control.<br/>

```bash
export VARIABLE=?
...
```

You must set the CODE_ROOT variable in this file<br/>
`export CODE_ROOT="$HOME/Documents/GitHub/"`

4) Apply the `windows-terminal-profile.json` to your windows terminal. <br/>
5) Install fonts from the Fonts folder
6) Add the below line into `~/.zshrc`: <br/>

```bash
source ~/dotfiles/main.sh
```

# Automation
These scripts automatically do the below:
- Load your SSH Credentials
- Load NVM