set -x EDITOR "/opt/nvim/nvim"
set -x BROWSER "firefox"
set -x TERMINAL "/opt/alacritty/alacritty"

# Disable the fish greeting message.
set fish_greeting

# Alias for managing dotfiles with git
alias dotfiles "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Add PATH entries
set PATH ~/.cargo/bin $PATH
set PATH /usr/local/bin $PATH

# Base16 Shell
# if status --is-interactive
#     eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
# end

# Start X at login
if status --is-login
    exec startx -- -keeptty
end
