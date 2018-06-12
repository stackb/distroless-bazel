load(
    "@distroless//package_manager:package_manager.bzl",
    "package_manager_repositories",
    "dpkg_src",
    "dpkg_list",
)

def debian_dependencies():

    package_manager_repositories()

    dpkg_src(
        name = "debian_stretch",
        arch = "amd64",
        distro = "stretch",
        sha256 = "4cb2fac3e32292613b92d3162e99eb8a1ed7ce47d1b142852b0de3092b25910c",
        snapshot = "20180406T095535Z",
        url = "http://snapshot.debian.org/archive",
    )

    dpkg_src(
        name = "debian_stretch_backports",
        arch = "amd64",
        distro = "stretch-backports",
        sha256 = "2863af9484d2d6b478ef225a8c740dac9a14015a594241a0872024c873123cdd",
        snapshot = "20180406T095535Z",
        url = "http://snapshot.debian.org/archive",
    )

    dpkg_src(
        name = "debian_stretch_security",
        package_prefix = "http://snapshot.debian.org/archive/debian-security/20180405T165926Z/",
        packages_gz_url = "http://snapshot.debian.org/archive/debian-security/20180405T165926Z/dists/stretch/updates/main/binary-amd64/Packages.gz",
        sha256 = "a503fb4459eb9e862d080c7cf8135d7d395852e51cc7bfddf6c3d6cc4e11ee5f",
    )

    dpkg_list(
        name = "package_bundle",
        packages = [
            # Version required to skip a security fix to the pre-release library
            # TODO: Remove when there is a security fix or dpkg_list finds the recent version
            "libc6=2.24-11+deb9u3",
            "ca-certificates",
            "openssl",
            "libssl1.0.2",
            "libssl1.1",
            "libbz2-1.0",
            "libdb5.3",
            "libffi6",
            "libncursesw5",
            "liblzma5",
            "libexpat1",
            "libreadline7",
            "libtinfo5",
            "libsqlite3-0",
            "mime-support",
            "netbase",
            "readline-common",
            "tzdata",
            
            #c++
            "libgcc1",
            "libgomp1",
            "libstdc++6",
            
            #java
            "zlib1g",
            "openjdk-8-jre-headless",
            "openjdk-8-jdk-headless",
            
            #python
            "libpython2.7-minimal",
            "python2.7-minimal",
            "libpython2.7-stdlib",
            
            # bazel
            "zlib1g-dev",
            "zip",
            "unzip",
            "libbz2-1.0",
            
            # bazel bash
            "bash",
            "dash",
            "libtinfo5",
            "base-files",
            "debianutils",
            "sensible-utils",
            "coreutils",
            "libacl1",
            "libattr1",
            "libselinux1",
            "libpcre3",
            
            # bazel awk
            "gawk",
            "libreadline7",
            "readline-common",
            "dpkg",
            "liblzma5",
            "tar",
            "libsigsegv2",
            
            # bazel g++
            "g++",
            "cpp",
            "cpp-6",
            "gcc-6-base",
            "libgmp10",
            "libisl15",
            "libmpc3",
            "libmpfr4",
            "g++-6",
            "gcc-6",
            "binutils",
            "libcc1-0",
            "libgcc1",
            "libstdc++6",
            "libgcc-6-dev",
            "libasan3",
            "libatomic1",
            "libitm1",
            "liblsan0",
            "libmpx2",
            "libquadmath0",
            "libtsan0",
            "libubsan0",
            "libc6-dev",
            "libc-dev-bin",
            "linux-libc-dev",
            "libstdc++-6-dev",
            "git",  # dkpg, git-man, libcurl3-gnutls, liberror-perl, libexpat1, libpcre3, perl, zlib1g
            "libcurl3-gnutls",  # libcomerr2, libgnutls30, libgssapi-krb5-2, libidn2-0, libk5crypto3, libkrb5-3, libldap-2.4-2, libnettle6,
            # libnghttp2-14, libpsl5, librtmp1, libssh2-1, zlib1g, ca-certificates
            "libcomerr2",
            "libgnutls30",  # libhogweed4, libidn11, libnettle6, libp11-kit0, libtasn1-6,
            "libidn2-0",
            "libhogweed4",
            "libnettle6",
            "libidn11",
            "libp11-kit0",  # libffi6
            "libffi6",  # libgcc1
            "libtasn1-6",
            "libssh2-1",  # libgcrypt20
            "librtmp1",  # multiple, repeated
            "libpsl5",  # libunistring0
            "libnghttp2-14",
            "libgcrypt20",  # libgpg-error0
            "libgpg-error0",
            "libunistring0",
            "libexpat1",
            "perl",
            "libperl5.24",
            "libdb5.3",
            "libgdbm3",
            "perl-modules-5.24",
            "perl-base",
            "liberror-perl",
            "libgssapi-krb5-2",
            "libk5crypto3",
            "libkeyutils1",
            "libkrb5support0",
            "libkrb5-3",
            "libldap-2.4-2",
            "libldap-common",
            "libsasl2-2",
            "libsasl2-modules-db",
            "libgmp10",
        ],
        # Takes the first package found: security updates should go first
        # If there was a security fix to a package before the stable release, this will find
        # the older security release. This happened for stretch libc6.
        sources = [
            "@debian_stretch_security//file:Packages.json",
            "@debian_stretch_backports//file:Packages.json",
            "@debian_stretch//file:Packages.json",
        ],
)
