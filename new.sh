#!/bin/bash

if [[ -n "$1" ]]; then
    pkgname="$1"
else
    read -rp "pkgname? " pkgname
fi

mkdir "$pkgname"

echo "# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=${pkgname}
pkgver=
pkgrel=1
provides=('')
conflicts=('')
pkgdesc=''
arch=('x86_64')
url=''
license=('')
depends=('')
makedepends=('')
optdepends=('')
source=(\"\")
sha256sums=('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')

build() {

}

package() {

}" >"${pkgname}/PKGBUILD"
