# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils meson toolchain-funcs readme.gentoo-r1 xdg

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.pwmt.org/pwmt/zathura-cb.git"
	EGIT_BRANCH="develop"
else
	KEYWORDS="~amd64 ~arm ~x86"
	SRC_URI="https://pwmt.org/projects/zathura/plugins/download/${P}.tar.xz"
fi

DESCRIPTION="Comic book plug-in for zathura with 7zip, rar, tar and zip support"
HOMEPAGE="https://pwmt.org/projects/zathura/"

LICENSE="ZLIB"
SLOT="0"
IUSE=""

RDEPEND=">=app-text/zathura-0.3.8
	dev-libs/glib:2=
	app-arch/libarchive:=
	x11-libs/cairo:=
	x11-libs/gdk-pixbuf:="
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_configure() {
	local emesonargs=(
		--libdir=/usr/$(get_libdir)
		)
	meson_src_configure
}

src_install() {
	FORCE_PRINT_ELOG=1
	local DOC_CONTENTS="Consider installing app-arch/p7zip app-arch/tar app-arch/unrar
		app-arch/unzip for additional file support."
	readme.gentoo_create_doc
	meson_src_install
}

pkg_postinst() {
	xdg_pkg_postinst
	readme.gentoo_print_elog
}
