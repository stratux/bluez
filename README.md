# Purpose

Repository for building arm64 bluez packages for Debian:bookworm based on bluez 5.79

# Building

See .github/workflows/release.yml for more information.

To build:

```
MY_UID="root" MY_GID="root" ./docker-run.sh "cd data && ./bluez-5.79.sh"
```
