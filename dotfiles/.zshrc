# Check if the base session name exists. If it does, increment the session_id until it finds a name that doesn't exist
base_name="main-"
session_id=0
# Launch TMUX terminal window manager
while tmux has-session -t "${base_name}${session_id}" 2>/dev/null; do
  session_id=$((session_id + 1))
done
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ "$TERM_PROGRAM" = 'iTerm.app' ]; then
  exec tmux new-session -s "${base_name}${session_id}" 
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup poverlevel10k
source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# Configure ZSH + custom keybinds
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
export ZSH_AUTOSUGGEST_STRATEGY=(completion)
export NVM_DIR="$HOME/.nvm"

bindkey "^[^[[D" backward-word # alt + left arrow = move one word to the left
bindkey "^[^[[C" forward-word # alt + right arrow = move one word to the right
bindkey "^[^[[?" backward-kill-word # alt + backspace = delete a whole word

bindkey 'ç' backward-kill-line

export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd' # ls colors like in Linux
export LS_COLORS='di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43' # used https://geoff.greer.fm/lscolors/ to convert them to LS_COLORS:
zstyle ':completion:*:default' list-colors "$LS_COLORS"

source "$HOME/.config/zsh/alias.zsh" # Load all my custom aliases in from another file

# Setup node version meanager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Setup ruby
export GEM_HOME=$HOME/.gem
export RUBY_GEM=$GEM_HOME/ruby/3.0.0
export PATH=$RUBY_GEM/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Setup bun 
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/asger/.bun/_bun" ] && source "/Users/asger/.bun/_bun"

# Add Go binaries to path
export PATH=$HOME/go/bin:$PATH

# Add C++ install path
export PATH="$CPP_INSTALL_PATH/bin:$PATH" 
export PATH=$PATH:$HOME/.local/binexport PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"

# Initialize zoxide using cd cmd as alias
eval "$(zoxide init --cmd cd zsh)"

# Configure fzf
export FZF_DEFAULT_COMMAND="find . -maxdepth 1"

# Configure lazy git
#export LG_CONFIG_FILE="${HOME}/.config/lazygit/config.yml,${HOME}/.config/lazygit/theme-catppuccin-latte.yml"
#
# Add .NET Core SDK tools
export PATH="$PATH:/Users/asger/.dotnet/tools"
