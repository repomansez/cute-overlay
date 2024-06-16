# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit font
DESCRIPTION=" A bitmap programming font optimized for coziness 💜 "
HOMEPAGE="https://github.com/slavfox/Cozette/"
SRC_URI="https://github.com/slavfox/Cozette/releases/download/v.${PV}/CozetteFonts-v-1-24-1.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/CozetteFonts"
FONT_S="${S}"
FONT_SUFFIX="otb"
