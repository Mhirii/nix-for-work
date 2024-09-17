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

if [ ! -x "$(command -v nix)" ]; then
	check_and_install_with_apt "curl"

	check_and_install "nix" "curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install || exit_error 'Failed to install Nix'"
fi

debug_log "Nix installed!"

check_and_install_with_apt "git"

if [ -d ~/nix ]; then
	debug_log "$HOME/nix directory exists"
	announce "Moving existing nix directory to nix-bak_$(date +'%d-%m')"
	mv ~/nix ~/nix-bak_"$(date +'%d-%m')"
fi

debug_log "Cloning repository..."
git clone "$repo" ~/nix || exit_error "Failed to clone repository"
debug_log "Repository cloned!"

debug_log "Building flake..."
nix run nixpkgs#home-manager -- switch --flake nix/#"$USER" || exit_error "Failed to build flake"
debug_log "Flake built!"
announce "Installation complete!"
