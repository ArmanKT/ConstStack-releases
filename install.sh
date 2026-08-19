#!/bin/bash
# ⚡ ConstStack macOS 1-Click Zero-Friction Installer & Gatekeeper Bypass
# Engineered by ConstMind (https://constmind.com)

set -e

echo ""
echo "  ⚡ ConstStack macOS 1-Click Installer"
echo "  ======================================="
echo "  Engineered by ConstMind (https://constmind.com)"
echo ""

APP_NAME="ConstStack.app"
DEST="/Applications/$APP_NAME"
TMP_DIR="/tmp/conststack_install_$$"
REPO="ArmanKT/ConstStack-releases"

mkdir -p "$TMP_DIR"
cd "$TMP_DIR"

echo "🔍 [1/4] Detecting latest ConstStack release from GitHub..."
LATEST_TAG=$(curl -sSL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' || echo "v1.0.0")
if [ -z "$LATEST_TAG" ] || [ "$LATEST_TAG" = "null" ]; then
    LATEST_TAG="v1.0.0"
fi
CLEAN_VER="${LATEST_TAG#v}"
DMG_NAME="ConstStack-macOS-${LATEST_TAG}.dmg"
DMG_URL="https://github.com/$REPO/releases/download/${LATEST_TAG}/${DMG_NAME}"

echo "📥 [2/4] Downloading ${DMG_NAME} (${LATEST_TAG})..."
curl -fSL --progress-bar "$DMG_URL" -o "ConstStack.dmg"

echo "📦 [3/4] Mounting disk image..."
MOUNT_DIR="/Volumes/ConstStack ${CLEAN_VER}"
hdiutil detach "$MOUNT_DIR" 2>/dev/null || true
hdiutil attach "ConstStack.dmg" -nobrowse -quiet

echo "🚀 [4/4] Installing ConstStack into /Applications & removing quarantine..."
if [ -d "$DEST" ]; then
    rm -rf "$DEST"
fi
cp -R "$MOUNT_DIR/$APP_NAME" /Applications/

# Unmount disk image & cleanup
hdiutil detach "$MOUNT_DIR" -quiet 2>/dev/null || true
rm -rf "$TMP_DIR"

# Bypass macOS Gatekeeper & remove Apple quarantine
xattr -cr "$DEST" 2>/dev/null || true
xattr -d com.apple.quarantine "$DEST" 2>/dev/null || true

echo ""
echo "========================================================="
echo "  ✅ ConstStack ${LATEST_TAG} installed successfully to /Applications!"
echo "  ✨ Opening ConstStack..."
echo "========================================================="
echo ""

# Launch application
open -a ConstStack 2>/dev/null || true
