#!/usr/bin/env bash

debug=true
repo='https://github.com/mhirii/nix-for-work'

debug_log() {
	if [ "$debug" = true ]; then
		echo "[DEBUG]: $1"
	fi
}
announce() {
	echo -e "\033[0;32m[INFO]: $1\033[0m"
}

exit_error() {
	echo -e "\033[0;31m[ERROR]: $1\033[0m"
	exit 1
}

check_and_install() {
	cmd=$1
	install_cmd=$2
	if [ ! -x "$(command -v "$cmd")" ]; then
		debug_log "$cmd is not installed"
		announce "Installing $cmd..."
		eval "$install_cmd"
	fi
}

check_and_install_with_apt() {
	package=$1
	check_and_install "$package" "sudo apt install $package"
}

install_deps_apt() {
	local packages=("git" "curl")
	for package in "${packages[@]}"; do
		check_and_install_with_apt "$package"
	done
}

install_nix() {
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
}

install_home_manager() {
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install
}

# ==============
# ==== MAIN ====
# ==============

install_deps_apt

if [ ! -x "$(command -v nix)" ]; then
	install_nix || exit_error 'Failed to install Nix'
fi

if [ ! -x "$(command -v home-manager)" ]; then
	install_home_manager || exit_error 'Failed to install Home Manager'
fi

if [ -d ~/nix ]; then
	debug_log "$HOME/nix directory exists"
	announce "Moving existing nix directory to nix-bak_$(date +'%d-%m')"
	mv ~/nix ~/nix-bak_"$(date +'%d-%m')"
fi
