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
		dir="$(pwd)/hyprland/$1"
		dest="$HOME/.config/$1"
		;;
	"kitty")
		dir="$(pwd)/shell-term/kitty"
		dest="$HOME/.config/kitty"
		;;
	*)
		echo "error: not a valid config name!"
		exit 1
		;;
esac

echo "linking $dir to $dest"
ln -s $dir $dest
if [ $? = 0 ]; then echo "done!"; else exit $?; fi


