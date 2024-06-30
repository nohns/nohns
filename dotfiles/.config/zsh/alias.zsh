#####################################
##                                 ##
##                                 ##
##   Alias configuration for ZSH   ##
##                                 ##
##                                 ##
#####################################

# Navigation aliases
alias p='cd ~/Projects'
alias s='cd "./$(fzf)"'

# Directory listings
alias ll='ls -alG'
alias llm='ls -alGtr'
alias tree='eza -laRT --git-ignore --show-symlinks'

# Edit config aliases
alias ez='nvim ~/.zshrc && source ~/.zshrc' # Edit zsh conf and reload 
alias es='nvim ~/.config/skhd/skhdrc && skhd --restart-service' # Edit skhd conf and reload
alias esb='nvim ~/.config/sketchybar/sketchybarrc && sketchybar --reload' # Edit sketchybar config and reload
alias ey='nvim ~/.config/yabai/yabairc && yabai --restart-service' # Edit yabai conf and reload
alias et='nvim ~/.tmux.conf && tmux source ~/.tmux.conf'
alias ev='PREV_CWD=$(pwd) && cd ~/.config/nvim/ && nvim && cd $PREV_CWD'
alias ea='nvim ~/.config/zsh/alias.zsh && source ~/.config/zsh/alias.zsh'

# Open utility aliases
alias of='open .' # Open CWD in finder 
alias pubkey='cat ~/.ssh/id_rsa.pub | pbcopy && echo "SSH public key copied to clipboard!"'
alias rosetta='echo "Now running terminal as x86_64. type \"exit\" cmd to get back to ARM64..." && arch -x86_64 /bin/zsh'

# Realias common unix core utils
alias vim='nvim'

# SSH aliases
alias ssh-htm='clear && ssh anappsdk@htm.anapps.dk -p 831'
alias ssh-serv2='clear && ssh nohns@serv2.nohns.dk'
alias ssh-linux='clear && ssh parallels@10.211.55.5'

# tmux aliases
alias ts='sh ~/.scripts/tmux-sessionizer'
alias ta='sh ~/.scripts/tmux-active-sessionizer'
alias tt='tmux kill-session'
alias tc='rm -rf ~/.cache/tmux-sessionizer/selected.log'
alias td='tmux detach'
