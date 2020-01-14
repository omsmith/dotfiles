#!/usr/bin/env bash

set -euo pipefail

SIGNING_KEYS="
https://dl-ssl.google.com/linux/linux_signing_key.pub
https://keybase.io/docs/server_security/code_signing_key.asc
https://download.docker.com/linux/ubuntu/gpg
https://bazel.build/bazel-release.pub.gpg
"

PPAS="
multiverse
ppa:git-core/ppa
ppa:peek-developers/stable
deb [arch=amd64] https://dl-ssl.google.com/linux/chrome/deb/ stable main
deb http://prerelease.keybase.io/deb stable main
deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable
deb [arch=amd64] https://packages.microsoft.com/ubuntu/19.04/prod eoan main
deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8
"

PACKAGES="
bazel
build-essential
code
dnsutils
docker-ce
dos2unix
git
gnupg
golang-go
gpg-agent
google-chrome-beta
graphicsmagick-imagemagick-compat
jq
keybase
maim
mpv
pavucontrol
peek
pulseaudio
rxvt-unicode-256color
slop
steam
suckless-tools
vlock
wget
xfonts-terminus
xinit
xmonad
xmonad-contrib
xmobar
"

init() {
	apt update
	apt full-upgrade --yes
	apt autoremove --yes --purge
	apt install --yes curl software-properties-common
}

add_apt_key() {
	local endpoint="${1}"; shift

	"curl -fsSL "${endpoint}" | apt-key add -"
}

add_ppa() {
	local ppa="${1}"; shift

	add-apt-repository --no-update "${ppa}"
}

add_ppas() {
	while read -r -s key; do
		if [ -z "${key}" ]; then
			continue
		fi

		add_apt_key "${key}"
	done < <(echo "${SIGNING_KEYS}")

	while read -r -s ppa; do
		if [ -z "${ppa}" ]; then
			continue
		fi

		add_ppa "${ppa}"
	done < <(echo "${PPAS}")

	apt update
}

install_packages() {
	xargs apt install --yes < <(echo "${PACKAGES}")
}

setup_node() {
	su -c "nave install lts lts; ln -sr .nave/installed/lts/bin/* bin" ${SUDO_USER}
}

main() {
	init
	add_ppas
	install_packages
	setup_node
}

main
