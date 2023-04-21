EAPI="8"

inherit font

DESCRIPTION="a font for programming and code review"
HOMEPAGE="https://github.com/IdreesInc/Monocraft"
SRC_URI="https://github.com/IdreesInc/${PN}/releases/download/v${PV}/Monocraft.ttf -> ${PN}.ttf"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="binchecks strip"
FONT_SUFFIX="ttf"
S="${WORKDIR}"
FONT_S="${PORTAGE_TMPDIR}/portage/${CATEGORY}/${P}/distdir"

src_unpack() {
	einfo "disabling src_unpack for it is not necessary here."
}
