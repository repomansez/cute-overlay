# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="xdg-desktop-portal backend for hyprland"
HOMEPAGE="https://github.com/hyprwm/xdg-desktop-portal-wlr"

PROTOCOMMIT=4d29e48433270a2af06b8bc711ca1fe5109746cd

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/hyprwm/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/hyprwm/${PN}/archive/v${PV}/v${PV}.tar.gz -> ${PN}.tar.gz \
	https://github.com/hyprwm/hyprland-protocols/archive/${PROTOCOMMIT}.tar.gz \
		-> hyprland-protocols-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"
	S="${WORKDIR}/${PF}"
fi

LICENSE="MIT"
SLOT="0/9999"
IUSE="elogind systemd"
REQUIRED_USE="?? ( elogind systemd )"

DEPEND="
	>=media-video/pipewire-0.3.41:=
	dev-libs/inih
	dev-libs/wayland
	media-libs/mesa
	x11-libs/libdrm
	|| (
		systemd? ( >=sys-apps/systemd-237 )
		elogind? ( >=sys-auth/elogind-237 )
		sys-libs/basu
	)
"
# mesa is needed for gbm dep (which it hards sets to 'on')
RDEPEND="
	${DEPEND}
	sys-apps/xdg-desktop-portal
"
BDEPEND="
	>=dev-libs/wayland-protocols-1.24
	virtual/pkgconfig
"

src_unpack() {
	default
	
	rmdir "${S}/subprojects/hyprland-protocols"
	mv "${WORKDIR}/hyprland-protocols-${PROTOCOMMIT}" "${S}/subprojects/hyprland-protocols" || die
}

src_configure() {
	local emesonargs=()

	if use systemd; then
		emesonargs+=(-Dsd-bus-provider=libsystemd)
	elif use elogind; then
		emesonargs+=(-Dsd-bus-provider=libelogind)
	else
		emesonargs+=(-Dsd-bus-provider=basu)
	fi
	meson_src_configure
}
