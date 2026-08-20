# Rebuilt Fedora

**Rebuilt Fedora** is a community-made remake of Fedora that keeps the familiar Fedora ecosystem while giving the system its own renamed identity and customization layer.

> ⚠️ Early development: this repository is a base for building the OS and is not yet a finished daily-driver distribution.

## What it is

Rebuilt Fedora is designed around the Fedora foundation:

- **DNF** for package management
- **RPM** packages
- **systemd** as the init system
- **NetworkManager** for networking
- **GNOME** as the main desktop environment
- Fedora's normal package ecosystem and repositories as the starting point
- A separate **Rebuilt Fedora** identity and configuration layer

The goal is to change the branding, defaults, configuration, and eventually the installer/image experience without throwing away the parts of Fedora that already work well.

## Repository layout

```text
.
├── packages/
│   └── base.txt          # Initial package set
├── rootfs/
│   └── etc/
│       ├── os-release    # Rebuilt Fedora identity
│       └── motd          # Login/welcome message
├── scripts/
│   └── build.sh          # Creates the initial root filesystem
└── README.md
```

## Building the base filesystem

The current builder is intended to run from a Fedora environment with `dnf` available:

```bash
sudo ./scripts/build.sh
```

The resulting filesystem is placed in `build/rootfs/`.

### Current base

The initial package set includes the core Fedora environment plus GNOME desktop components and common networking/system utilities. The package list can be edited in `packages/base.txt`.

## Planned features

- [ ] Rebuilt Fedora artwork and branding
- [ ] Custom boot splash
- [ ] Custom installer/image build
- [ ] Rebuilt Fedora desktop defaults
- [ ] Custom first-boot experience
- [ ] VM-ready ISO generation
- [ ] UEFI and BIOS boot support
- [ ] Rebuilt Fedora release/version metadata
- [ ] More custom system utilities and configuration

## Relationship to Fedora

Rebuilt Fedora is a downstream/community project. It is intended to use Fedora's existing open-source technologies and package ecosystem while adding its own identity and configuration. Fedora trademarks and branding are not intended to be redistributed as Rebuilt Fedora branding.

## Status

🚧 **Prototype / early development**

The repository currently contains the initial filesystem structure and package manifest. Image generation and deeper customization will be added as the project develops.

## License

Project-specific files in this repository are released under the **MIT License**, unless a file states otherwise. Fedora and other third-party components retain their own licenses.
