pkg_name=libsrtp
pkg_origin=mozillareality
pkg_maintainer="Mozilla Mixed Reality <mixreality@mozilla.com>"

pkg_version="2.2.0"
pkg_source="https://github.com/cisco/libsrtp/archive/v${pkg_version}.zip"
pkg_shasum="39fad3e6c805d6f98d8c7df101b17e22873de551938870cdd8936008af45d507"
pkg_build_deps=(core/make core/gcc core/automake) 
pkg_deps=(core/make core/gcc mozillareality/openssl core/automake) 
pkg_description="This package provides an implementation of the Secure Real-time Transport Protocol (SRTP), the Universal Security Transform (UST), and a supporting cryptographic kernel."
pkg_upstream_url="https://github.com/cisco/libsrtp"
pkg_config_dirs=${pkg_prefix}
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

do_build() {
  CFLAGS="${CFLAGS} -O2 -g" CPPFLAGS="${CPPFLAGS} -O2 -g" CXXFLAGS="${CXXFLAGS} -O2 -g" ./configure --prefix "${pkg_prefix}" --enable-openssl --with-openssl-dir="$(pkg_path_for "mozillareality/openssl")"
  make shared_library
}
