#!/usr/bin/env bash
set -euo pipefail

# Rebuilt Fedora base filesystem builder.
# Run this on a Fedora host with dnf and root privileges.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="${ROOT_DIR}/build/rootfs"
PACKAGES="${ROOT_DIR}/packages/base.txt"

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run this script as root (for example: sudo ./scripts/build.sh)"
  exit 1
fi

rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"

echo "==> Installing the Rebuilt Fedora base system"
dnf -y --releasever="$(rpm -E %fedora)" \
  --installroot="${BUILD_DIR}" \
  --setopt=install_weak_deps=False \
  --setopt=keepcache=False \
  install $(grep -vE '^\s*(#|$)' "${PACKAGES}" | tr '\n' ' ')

mkdir -p "${BUILD_DIR}/etc"
cp "${ROOT_DIR}/rootfs/etc/os-release" "${BUILD_DIR}/etc/os-release"
cp "${ROOT_DIR}/rootfs/etc/motd" "${BUILD_DIR}/etc/motd"

echo "==> Rebuilt Fedora base filesystem created at: ${BUILD_DIR}"
echo "==> Next step: add image/ISO generation for your target (VM, BIOS, or UEFI)."
