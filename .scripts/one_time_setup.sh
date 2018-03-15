# update system
sudo xbps-install -Su

# install ntp daemon
# Chrony is supposed to be a newer, superior implementation of ntp (versus ntpd and openntp).
# Installing Chrony disables access to hwclock (and I don't know why).
sudo xbps-install -Sy chrony
sudo ln -s /etc/sv/chronyd/ /var/service/
sudo sv start chronyd

# install pkg-config
sudo xbps-install -Sy pkg-config

# install user applications
sudo xbps-install -Sy \
    void-repo-nonfree \
    fish-shell \
    neovim \
    tmux \
    git \
    ripgrep \
    fzf \
    fd \
    ranger \
    alacritty \
    curl \
    libcurl \
    obs \
    htop \
    glances \
    neofetch \
    feh \
    cmus \
    cmus-faad \
    cmus-ffmpeg \
    cmus-flac \
    cmus-mpc \
    cmus-opus \
    cmus-pulseaudio \
    cava \
    pulsemixer \
    ponymix \
    pavucontrol \
    weechat \
    xcalib \
    xclip \
    tokei \
    chromium \
    firefox \
    maim \
    exa \
    rr \
    rustup \
    gcc \
    make \
    cmake \
    tty-clock \
    xz \
    spacefm-ng \
    keepassxc \
    ntfs-3g \
    arandr \
    rofi \
    font-awesome \
    google-fonts-ttf \
    twemoji \
    gucharmap \
    zip \
    unzip

# needed for AwesomeWM:
# * lua52
# * lua52-devel
# * make
# * cmake
# * libxcb 
# * libxcb-devel
# * xcb-cursor
# * xcb-cursor-devel

# set fish as the default shell
sudo runuser -l terry -c 'chsh -s /usr/bin/fish'

# setup git credentials
git config --global user.name "Terry Brashaw"
git config --global user.email "terrybrashaw@gmail.com"

# install the nightly toolchain for rust
rustup toolchain install nightly
rustup default nightly

# install rust applications
cargo install clippy
