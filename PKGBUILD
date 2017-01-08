# Maintainer: Sebastian Fedrau <sebastian.fedrau@gmail.com>
pkgname=efind-taglib
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Filter search results by audio tags and properties."
arch=('i686' 'x86_64')
url="https://github.com/20centaurifux/efind-taglib"
license=('GPL3')
groups=()
depends=('efind>=0.1.0' 'taglib>=1.10.1-1')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=('')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
