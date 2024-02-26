# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.p10k.zsh

alias ezsh='code ~/.zshrc'
alias rzsh='source ~/.zshrc'
alias p='cd ~/Projects'
alias ll='ls -alG'
alias llm='ls -alGtr'
alias pubkey='cat ~/.ssh/id_rsa.pub | pbcopy && echo "SSH public key copied to clipboard!"'
alias ssh-htm='clear && ssh anappsdk@htm.anapps.dk -p 831'
alias ssh-serv1='clear && ssh nohns@serv1.nohns.dk'
alias ssh-serv2='clear && ssh nohns@serv2.nohns.dk'
alias ssh-linux='clear && ssh parallels@10.211.55.5'
alias ssh-pi='clear && ssh pi@raspberrypi.local'
alias ssh-vm='clear && ssh stud@192.168.34.128'
alias rosetta='echo "Now running terminal as x86_64. type \"exit\" cmd to get back to ARM64..." && arch -x86_64 /bin/zsh'
alias ez='nvim ~/.zshrc && source ~/.zshrc' # Edit zsh conf and reload 
alias es='nvim ~/.config/skhd/skhdrc && skhd --restart-service' # Edit skhd conf and reload
alias esb='nvim ~/.config/sketchybar/sketchybarrc && sketchybar --reload' # Edit sketchybar config and reload
alias ey='nvim ~/.config/yabai/yabairc && yabai --restart-service' # Edit yabai conf and reload
alias rt='tmux source ~/.tmux.conf' #Reload tmux
alias of='open .' # Open CWD in finder 
alias vim='nvim'
alias ev='PREV_CWD=$(pwd) && cd ~/.config/nvim/ && nvim && cd $PREV_CWD'
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export GEM_HOME=$HOME/.gem
export RUBY_GEM=$GEM_HOME/ruby/3.0.0
export PATH=$RUBY_GEM/bin:$PATH

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
export ZSH_AUTOSUGGEST_STRATEGY=(completion)


# Add Go binaries to path
export PATH=$HOME/go/bin:$PATH

# Add daprd to path
export PATH=$PATH:/Users/asger/.dapr/bin
export PATH="/Applications/MAMP/Library/bin:$PATH"

# Add C++ install path
export PATH="$CPP_INSTALL_PATH/bin:$PATH" 
export PATH=$PATH:$HOME/.local/binexport PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"

# Setup ruby env for iOS development
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# bun completions
[ -s "/Users/asger/.bun/_bun" ] && source "/Users/asger/.bun/_bun"

# Add Bun to path 
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Bind backward and forward with alt + arrow keys
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[^[[?" backward-kill-word

# Bind alt + c to clear a line
bindkey 'ç' backward-kill-line

# Set LS colors so they work on dark terminals
export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd' # ls colors like in Lin
# used https://geoff.greer.fm/lscolors/ to convert them to LS_COLORS:
export LS_COLORS='di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43' 
zstyle ':completion:*:default' list-colors "$LS_COLORS"

# Launch TMUX terminal window manager
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

