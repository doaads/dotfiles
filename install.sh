#!/bin/bash

echo "      .o8                                      .o8           ";
echo "     \"888                                     \"888           ";
echo " .oooo888   .ooooo.   .oooo.    .oooo.    .oooo888   .oooo.o ";
echo "d88' \`888  d88' \`88b \`P  )88b  \`P  )88b  d88' \`888  d88(  \"8 ";
echo "888   888  888   888  .oP\"888   .oP\"888  888   888  \`\"Y88b.  ";
echo "888   888  888   888 d8(  888  d8(  888  888   888  o.  )88b ";
echo "\`Y8bod88P\" \`Y8bod8P' \`Y888\"\"8o \`Y888\"\"8o \`Y8bod88P\" 8\"\"888P' ";
echo "                                                                      ";
echo "---------------------------- [.dotfiles] -----------------------------";
echo "                                                                      ";

# Define the required packages for each config
declare -A CONFIG_PACKAGES
CONFIG_PACKAGES["nvim"]="neovim ripgrep fd lua unzip"
CONFIG_PACKAGES["tmux"]="tmux"
CONFIG_PACKAGES["zshrc"]="zsh zoxide"
CONFIG_PACKAGES["niri"]="niri swaybg network-manager-applet fuzzel playerctl brightnessctl swaylock waybar"
CONFIG_PACKAGES["waybar"]="waybar networkmanager nm-connection-editor pavucontrol power-profiles-daemon otf-font-awesome"
CONFIG_PACKAGES["kitty"]="kitty otf-fira-code-nerd"
CONFIG_PACKAGES["doom"]="neovim emacs"
CONFIG_PACKAGES["hypr"]="hyprland hyprpaper eww waybar"

declare -A XTRA_MESSAGE
XTRA_MESSAGE["nvim"]="nvim will require a manual packer install: https://github.com/wbthomason/packer.nvim"
XTRA_MESSAGE["tmux"]="tmux will require a manual TPM install: https://github.com/tmux-plugins/tpm"
XTRA_MESSAGE["zshrc"]="this script does not modify your default shell."
XTRA_MESSAGE["waybar"]="the network module might require mullvad-vpn and/or a 'homelab' NetworkManager connection sourced from wireguard to work."

if [ $# -lt 1 ]; then
    echo "Argument required: config to be installed"
    echo "Usage: $0 <config> [platform]"
    echo "valid options:"
    printf "\t - nvim\n"
    printf "\t - tmux\n"
    printf "\t - zshrc\n"
    printf "\t - niri\n"
    printf "\t - waybar\n"
    printf "\t - kitty\n"
    printf "\t - doom (deprecated)\n"
    printf "\t - hypr (deprecated)\n"
    exit 0
fi

config_name="$1"
platform="default"
if [ $# -eq 2 ]; then
    platform="$2"
fi

if [[ -z "${CONFIG_PACKAGES[$config_name]}" ]]; then
    echo "error: not a valid config name or no packages defined for it!"
    exit 1
fi
packages=${CONFIG_PACKAGES[$config_name]}

message="you will be asked for confirmation before the $config_name config is linked."
if [[ -n "${XTRA_MESSAGE[$config_name]}" ]]; then
    message="${XTRA_MESSAGE[$config_name]}"
fi

echo "Starting installation for: $config_name"
echo "Required packages: $packages"

to_install=()

for pkg in $packages; do
    if pacman -Qs "$pkg" > /dev/null 2>&1; then
        echo "[✓] $pkg is already installed"
    else
        echo "[ ] $pkg is NOT installed"
        to_install+=("$pkg")
    fi
done

echo "";
echo "> Note: $message";
echo "";

skip_install=0

if [ ${#to_install[@]} -eq 0 ]; then
    echo "All required packages are already installed."
    skip_install=1
fi

if [ $skip_install != 1 ]; then
    echo ""
    echo "The following packages will be installed:"
    for pkg in "${to_install[@]}"; do
        echo "  - $pkg"
    done
    echo ""

    read -p "Do you want to proceed with the installation? (y/N): " confirm
    if [[ ! $confirm =~ ^[Yy]$ ]]; then
        echo "Installation aborted by user."
        exit 0
    fi

    echo "Installing packages..."
    sudo pacman -S --noconfirm "${to_install[@]}"
fi

if [ $? -eq 0 ]; then
    echo ""
    read -p "Do you want to link the $config_name configuration? (y/N): " link_confirm
    if [[ $link_confirm =~ ^[Yy]$ ]]; then
        echo "Linking $config_name..."
        bash "$(dirname "$0")/link.sh" "$config_name" "$platform"
    else
        echo "Skipping linking."
    fi
else
    echo "Error: Installation failed."
    exit 1
fi
