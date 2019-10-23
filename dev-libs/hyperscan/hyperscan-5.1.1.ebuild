# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit cmake-utils python-r1 flag-o-matic

DESCRIPTION="High-performance regular expression matching library"
SRC_URI="https://github.com/01org/hyperscan/archive/v${PV}.tar.gz -> ${P}.tar.gz"
HOMEPAGE="https://01.org/hyperscan"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cpu_flags_x86_ssse3 static-libs"

RDEPEND="${PYTHON_DEPS}
	dev-util/ragel
	dev-libs/boost
	net-libs/libpcap"
BDEPEND="${RDEPEND}"

REQUIRED_USE="cpu_flags_x86_ssse3 ${PYTHON_REQUIRED_USE}"

PATCHES=( "${FILESDIR}/gentoo_build_is_release.patch" )

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=$(usex '!static-libs')
		-DBUILD_STATIC_AND_SHARED=$(usex static-libs)
		-DRELEASE_BUILD=yes
	)
	cmake-utils_src_configure
}
