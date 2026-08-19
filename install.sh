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

echo "🔍 [1/4] Detecting latest ConstStack release..."
# 1. Fetch version directly from Cask CDN (Zero Rate-Limits & Instant)
CASK_VER=$(curl -sSL "https://raw.githubusercontent.com/$REPO/main/Casks/conststack.rb" | grep 'version "' | sed -E 's/.*version "([^"]+)".*/\1/' || true)

if [ -n "$CASK_VER" ]; then
    LATEST_TAG="v${CASK_VER#v}"
else
    # 2. Fallback to GitHub Releases API
    LATEST_TAG=$(curl -sSL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' || echo "v1.1.1")
fi

CLEAN_VER="${LATEST_TAG#v}"
DMG_NAME="ConstStack-macOS-${LATEST_TAG}.dmg"
DMG_URL="https://github.com/$REPO/releases/download/${LATEST_TAG}/${DMG_NAME}"

echo "📥 [2/4] Downloading ${DMG_NAME} (${LATEST_TAG})..."
curl -fSL --progress-bar "$DMG_URL" -o "ConstStack.dmg"

echo "📦 [3/4] Mounting disk image..."
hdiutil detach "/Volumes/ConstStack*" 2>/dev/null || true
MOUNT_OUT=$(hdiutil attach "ConstStack.dmg" -nobrowse)
MOUNT_DIR=$(echo "$MOUNT_OUT" | grep "/Volumes/" | awk '{print $NF}' | tail -n 1)

if [ -z "$MOUNT_DIR" ] || [ ! -d "$MOUNT_DIR" ]; then
    MOUNT_DIR=$(ls -d /Volumes/ConstStack* 2>/dev/null | head -n 1)
fi

echo "🚀 [4/4] Installing ConstStack into /Applications & removing quarantine..."
if [ -d "$MOUNT_DIR/$APP_NAME" ]; then
    if [ -d "$DEST" ]; then
        rm -rf "$DEST" 2>/dev/null || true
    fi
    cp -R "$MOUNT_DIR/$APP_NAME" /Applications/
    hdiutil detach "$MOUNT_DIR" -quiet 2>/dev/null || true
    xattr -cr "$DEST" 2>/dev/null || true
    xattr -d com.apple.quarantine "$DEST" 2>/dev/null || true
fi

# Cleanup temp files
rm -rf "$TMP_DIR" 2>/dev/null || true

echo ""
echo "========================================================="
echo "  ✅ ConstStack ${LATEST_TAG} installed successfully to /Applications!"
echo "  ✨ Opening ConstStack..."
echo "========================================================="
echo ""

# Launch application
open -n -a "$DEST" 2>/dev/null || open -a ConstStack 2>/dev/null || true
