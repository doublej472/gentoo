# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.pwmt.org/pwmt/zathura-ps.git"
	EGIT_BRANCH="develop"
else
	KEYWORDS="~amd64 ~arm ~x86"
	SRC_URI="https://pwmt.org/projects/zathura/plugins/download/${P}.tar.xz"
fi

DESCRIPTION="PostScript plug-in for zathura"
HOMEPAGE="https://pwmt.org/projects/zathura/"

LICENSE="ZLIB"
SLOT="0"

DEPEND=">=app-text/libspectre-0.2.6:=
	>=app-text/zathura-0.3.8
	dev-libs/glib:2=
	x11-libs/cairo:="

RDEPEND="${DEPEND}"

BDEPEND="virtual/pkgconfig"
