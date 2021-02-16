#!/bin/bash

set -eo pipefail

confirm() {
    read -pr "Continue? [y/N] " reply
    case "$reply" in
    [yY][eE][sS] | [yY]) true ;;
    *) false ;;
    esac
}

if [[ "$1" == "" ]]; then
    echo "Package?"
    select pkg in $(exa -D); do
        break
    done
else
    pkg="$1"
fi

cd "$pkg"

if [[ "$2" == "" ]]; then
    source PKGBUILD
    echo "Old version: $pkgver"
    read -pr "New version? " ver
else
    ver="$2"
fi

sed -i "s/pkgver=[0-9\.]\+/pkgver=$ver/" PKGBUILD
sed -i "s/pkgrel=[0-9\.]\+/pkgrel=1/" PKGBUILD
checksums="$(makepkg -g)"
perl -i -p0e "s/sha256sums=\(['0-9a-z \n]+\)/$checksums/" PKGBUILD
makepkg --printsrcinfo >.SRCINFO

git clean -dxn
confirm
git clean -dxf

git add -A
git diff --cached
confirm

git commit -am "$pkg: update to $ver"
git push
