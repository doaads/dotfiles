#!/bin/bash
# |--------------------|
# |CONFIG LINKER SCRIPT|
# |--------------------|
if [ $# -lt 1 ]; then
	echo "Argument required: config to be linked"
	echo "valid options:"
	printf "\t - nvim\n"
	printf "\t - tmux\n"
	printf "\t - zshrc\n"
	printf "\t - hypr\n"
	printf "\t - waybar\n"
	printf "\t - kitty\n"
	printf "\t - doom\n"
	exit 0
fi

if [ $# = 2 ]; then
    platform="$2"
    echo "Platform: $2"
else
    platform="laptop"
    echo "Using default platform: ($platform)"
fi

case $1 in
	"nvim")
		dir="$(pwd)/nvim"
		dest="$HOME/.config/nvim"
		;;
	"tmux")
		dir="$(pwd)/tmux/.tmux.conf"
		dest="$HOME/.tmux.conf"
		;;
	"zshrc")
		dir="$(pwd)/shell-term/.zshrc"
		dest="$HOME/.zshrc"
		;;
	"hypr"|"waybar")
        dir="$(pwd)/$platform/hyprland/$1"
		dest="$HOME/.config/$1"
		;;
	"kitty")
		dir="$(pwd)/shell-term/kitty"
		dest="$HOME/.config/kitty"
		;;
	"doom")
		dir="$(pwd)/doom/.doom.d"
		dest="$HOME/.doom.d"
		;;
	*)
		echo "error: not a valid config name!"
		exit 1
		;;
esac

echo "linking $dir to $dest"
if [ -L "$dest" ]; then
    echo "$dest exists and is a symlink, removing"
    rm $dest
elif [ -d "$dest" ]; then
    echo "$dest exists, moving to ${dest}_old"
    mv "$dest" "${dest}_old"
fi


ln -s $dir $dest
if [ $? = 0 ]; then echo "done!"; else exit $?; fi


