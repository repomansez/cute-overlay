# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	adler@1.0.2
	base64@0.21.7
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.5.0
	cc@1.0.90
	cfg-if@1.0.0
	colored@2.1.0
	console@0.15.8
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	crc32fast@1.4.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.2
	flate2@1.0.28
	form_urlencoded@1.2.1
	getopts@0.2.21
	getrandom@0.2.12
	hashbrown@0.14.3
	idna@0.5.0
	indexmap@2.2.6
	indicatif@0.17.8
	instant@0.1.12
	itoa@1.0.11
	lazy_static@1.4.0
	libc@0.2.153
	libredox@0.0.1
	linux-raw-sys@0.4.13
	log@0.4.21
	memchr@2.7.1
	mime@0.3.17
	mime_guess@2.0.4
	miniz_oxide@0.7.2
	multipart@0.18.0
	number_prefix@0.4.0
	once_cell@1.19.0
	openssl-probe@0.1.5
	percent-encoding@2.3.1
	portable-atomic@1.6.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.79
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.4.1
	redox_users@0.4.4
	ring@0.17.8
	rustix@0.38.32
	rustls-native-certs@0.7.0
	rustls-pemfile@2.1.1
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.5
	rustls@0.23.11
	ryu@1.0.17
	schannel@0.1.23
	security-framework-sys@2.9.1
	security-framework@2.9.2
	serde@1.0.204
	serde_derive@1.0.204
	serde_json@1.0.115
	serde_spanned@0.6.7
	spin@0.9.8
	subtle@2.5.0
	syn@2.0.55
	tempfile@3.10.1
	thiserror-impl@1.0.63
	thiserror@1.0.63
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.8.17
	toml_datetime@0.6.8
	toml_edit@0.22.18
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-width@0.1.11
	untrusted@0.9.0
	ureq@2.10.0
	url@2.5.2
	version_check@0.9.4
	wasi@0.11.0+wasi-snapshot-preview1
	webpki-roots@0.26.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	winnow@0.6.16
	zeroize@1.7.0
"

inherit cargo

DESCRIPTION="A CLI tool for rustypaste"
HOMEPAGE="https://github.com/orhun/rustypaste"
SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/orhun/rustypaste-cli/archive/refs/tags/v0.9.1.zip -> ${P}.zip
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	BSD ISC MIT MPL-2.0 Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64"