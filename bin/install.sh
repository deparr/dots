#!/usr/bin/env bash


set -e
set -x

# set up work dirs
mkdir -p ~/dev
mkdir -p ~/build
#---


sudo xbps-install -Su

sudo xbps-install -y \
    make cmake git \
    gcc autoconf automake pkg-config unzip \
    curl wget xz 7zip gzip


# {{{ Rust tools

if ! [ -x "$(command -v cargo)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi


# currently use mason to manage lsp,
# this will probably conflict
#if ! command -v rust_analyzer &> /dev/null ; then
#    git clone https://github.com/rust-analyzer/rust-analyzer ~/build/rust-analyzer
#    cd ~/build/rust-analyzer
#    cargo xtask install --server
#fi

cargo install \
    git-trim \
    ripgrep \
    fd-find \
    watchexec-cli \
    starship


if ! [ -d ~/build/alacritty/ ]; then
    sudo xbps-install -y \
    freetype-devel expat-devel fontconfig-devel \
    libxcb-devel python3 \

    git clone https://github.com/alacritty/alacritty.git ~/build/alacritty
    cd ~/build/alacritty; cargo build --release;

    sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    sudo cp target/release/alacritty /usr/bin
    sudo cp extra/local/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install extra/linux/Alacritty.desktop
    sudo update-desktop-database

    sudo mkdir -p /usr/local/share/man/man1
    gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
    gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

    # TODO: do shell completions

fi

# }}}

sudo xbps-install -y zsh

