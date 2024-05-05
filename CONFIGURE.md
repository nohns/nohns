# Configure

For setting up the development environment, make sure Brew is installed:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Install languages and tools

Install Xcode tools:
```
xcode-select --install
```

Install Go via brew:

```
brew install go
```

## Neovim IDE and dependencies

Install Neovim via brew:

```
brew install neovim
```

Install revelant tooling for Go development in Neovim:

```
go install golang.org/x/tools/cmd/goimports@latest
```

Install relevant tools for Neovim:

```
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
brew install ripgrep fzf nnn lazygit
```
