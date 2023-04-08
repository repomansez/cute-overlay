# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fcaps meson


DESCRIPTION="Efficient micro-compositor for running games"
HOMEPAGE="https://github.com/ValveSoftware/gamescope"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ValveSoftware/gamescope"
else
	MY_PV=$(ver_rs 3 -)
	MY_PV="${MY_PV//_/-}"\
	SRC_URI="https://github.com/ValveSoftware/${PN}/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-${MY_PV}"
fi

LICENSE="BSD-2"
SLOT="0"
IUSE="pipewire +wsi-layer"

RDEPEND="
	=dev-libs/libliftoff-0.4*
	>=dev-libs/wayland-1.21
	>=dev-libs/wayland-protocols-1.17
	=gui-libs/wlroots-0.16*[X]
	media-libs/libdisplay-info
	media-libs/libsdl2[video,vulkan]
	media-libs/vulkan-loader
	sys-apps/hwdata
	sys-libs/libcap
	>=x11-libs/libdrm-2.4.109
	x11-libs/libX11
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libxkbcommon
	x11-libs/libXrender
	x11-libs/libXres
	x11-libs/libXtst
	x11-libs/libXxf86vm
	pipewire? ( >=media-video/pipewire-0.3:= )
	wsi-layer? ( x11-libs/libxcb )
"
DEPEND="
	${RDEPEND}
	dev-libs/stb
	dev-util/vulkan-headers
	wsi-layer? ( >=media-libs/vkroots-0_p20230103 )
"
BDEPEND="
	dev-util/glslang
	dev-util/wayland-scanner
"

FILECAPS=(
	cap_sys_nice usr/bin/${PN}
)

src_prepare() {
	default

	# Normally wraps stb with Meson. Upstream does not ship a pkg-config file so
	# we don't install one. Work around this using symlinks.
	mkdir subprojects/stb || die
	ln -sn "${ESYSROOT}"/usr/include/stb/* "${S}"/subprojects/packagefiles/stb/* subprojects/stb/ || die
}

src_configure() {
	local emesonargs=(
		--force-fallback-for=libdisplay-info,wlroots,vkroots
		-Denable_openvr_support=false
		$(meson_feature pipewire)
		$(meson_use wsi-layer enable_gamescope_wsi_layer)
	)
	meson_src_configure
}

src_install() {
	meson_src_install --skip-subprojects
}
