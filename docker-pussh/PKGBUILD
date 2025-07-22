# Maintainer: Yufan You <ouuansteve at gmail>
# Maintainer: asm0dey <me@asm0dey.site>

pkgname=docker-pussh
pkgver=0.2.0
pkgrel=1
pkgdesc='Push docker images directly to remote servers without an external registry'
arch=(any)
url='https://github.com/psviderski/unregistry'
license=('Apache-2.0')
source=("docker-pussh-$pkgver::$url/raw/refs/tags/v$pkgver/docker-pussh")
sha256sums=('51eab4cf6b8d14e7c896869a9f2d50ebfd1a95515664857bbb2514815fa34e27')
depends=(docker bash openssh)

package() {
    install -Dm 755 "$srcdir/docker-pussh-$pkgver" "$pkgdir"/usr/lib/docker/cli-plugins/docker-pussh
}
