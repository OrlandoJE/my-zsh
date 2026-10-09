# my zsh

> this covers zsh installation and basic configuration for a smooth shell experience. if you want to dive into the tooling i use through zsh, visit [this repo's wiki](https://github.com/OrlandoJE/my-zsh/wiki/my-zsh) 

## installation

#### Windows (WSL)

before installing zsh on Windows, a supported environment is required. WSL is my preferred way to use zsh. You can install WSL it via the following command in Powershell:

```Powershell
wsl --install
```

> the above command will install Ubuntu by default. You can also install other distributions like Debian, Kali Linux, etc. You can find the list of available distributions [here](https://learn.microsoft.com/en-us/windows/wsl/install).

### package manager (Windows, macOS, Linux)

from here on, and for simplicity, Homebrew will be used to install the required packages. you can install Homebrew by running the following command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### install zsh

> before installing zsh, make sure to check if zsh is already installed by running `zsh --version` in your terminal, if already installed, you can skip this step.
> macOS comes with zsh pre-installed, no need for installation.

after installing Homebrew, you can install zsh by running the following command in your terminal:

```bash
brew install zsh
```

#### set zsh as default shell

to set zsh as your default shell, run the following command:

```bash
chsh -s $(which zsh)
```

## configuration

### completion

we're using the default completion system that comes with zsh, simply add the following lines to your `~/.zshrc` file; if the file doesn't exist, create it first using `touch ~/.zshrc`:

```bash
# ~/.zshrc
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zmodload zsh/complist
compinit
_comp_options+=('globdots')
alias ls='ls --color=auto'
```

### deja (autosuggestions)

deja is a zsh plugin that provides autosuggestions based on your command history. to install deja, run the following command in your terminal:

```bash
brew install zsh-deja
```

then add the following line to your `~/.zshrc` file:

```bash
# ~/.zshrc
export DEJA_CYCLE_KEY=$'\e[Z' # bind shift+tab to cycle through suggestions to avoid conflicts with the default tab completion
eval "$(deja init zsh)"
```

### superfile

superfile is a zsh plugin that provides my preferred way to navigate my files. to install superfile, run the following command in your terminal:

```bash
brew install superfile
```
and execute it by typing `spf` in your terminal.

### starship

starship is a cross-shell prompt that is fast, customizable, and easy to install. to install starship, run the following command in your terminal:

```bash
brew install starship
```

then add the following line to your `~/.zshrc` file:

```bash
# ~/.zshrc
eval "$(starship init zsh)"
```

to configure starship, create a `~/.config/starship.toml` file and add your configuration. you can find the full documentation [here](https://starship.rs/config/).

> i left my preferred configuration (`~/.config/` folder) in this repository, you can use it as a reference or copy it to your own configuration.
