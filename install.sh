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
DMG_URL="https://github.com/ArmanKT/ConstStack-releases/releases/download/v1.0.0/ConstStack-macOS-v1.0.0.dmg"
FALLBACK_RAW_URL="https://raw.githubusercontent.com/ArmanKT/ConstStack-releases/main/ConstStack-macOS-v1.0.0.dmg"

mkdir -p "$TMP_DIR"
cd "$TMP_DIR"

echo "📥 [1/4] Downloading latest ConstStack release..."
if curl -fSL --progress-bar "$DMG_URL" -o "ConstStack.dmg" 2>/dev/null; then
    echo "  ✓ Downloaded from GitHub Releases"
else
    echo "  → Fetching directly from repository mirror..."
    curl -fSL --progress-bar "$FALLBACK_RAW_URL" -o "ConstStack.dmg"
fi

echo "📦 [2/4] Mounting disk image..."
MOUNT_DIR="/Volumes/ConstStack 1.0.0"
hdiutil detach "$MOUNT_DIR" 2>/dev/null || true
hdiutil attach "ConstStack.dmg" -nobrowse -quiet

echo "🚀 [3/4] Installing ConstStack into /Applications..."
if [ -d "$DEST" ]; then
    rm -rf "$DEST"
fi
cp -R "$MOUNT_DIR/$APP_NAME" /Applications/

# Unmount disk image & cleanup
hdiutil detach "$MOUNT_DIR" -quiet 2>/dev/null || true
rm -rf "$TMP_DIR"

echo "🛡️  [4/4] Bypassing macOS Gatekeeper & removing quarantine..."
xattr -cr "$DEST" 2>/dev/null || true
xattr -d com.apple.quarantine "$DEST" 2>/dev/null || true

echo ""
echo "========================================================="
echo "  ✅ ConstStack installed successfully to /Applications!"
echo "  ✨ Opening ConstStack..."
echo "========================================================="
echo ""

# Launch application
open -a ConstStack 2>/dev/null || true
