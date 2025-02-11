#!/bin/bash
# Intended to be run from inside of a debian arm64 container
#
# Builds bluez-5.79 package under debian:bookworm
#
# See https://www.linuxjournal.com/content/rebuilding-and-modifying-debian-packages for reference

mkdir -p bluez
cd bluez

# set up the appropriate source to get bluez-5.79
cat > /etc/apt/sources.list.d/debian_unstable.sources <<EOF
Types: deb-src
# http://snapshot.debian.org/archive/debian/20250203T000000Z
URIs: http://deb.debian.org/debian
Suites: unstable
Components: main
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

apt update
apt source bluez
cd bluez-5.79

# libsystemd-dev was renamed to systemd-dev between bookworm and unstable
sed -i 's/ systemd-dev/ libsystemd-dev/g' debian/control

debuild -us -uc

cd ..

# output packages are in bluez folder
echo "Output files are located at " `pwd`
